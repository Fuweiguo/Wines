import hashlib
import random

import time

from django.core.cache import cache
from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.


#主页
from app.models import *


def index(request):
    token = request.session.get('token')
    phone = cache.get(token)

    goods = Goods.objects.all()

    user = None
    if phone:
        user = Users.objects.get(phone=phone)

    return render(request, 'index/index.html',context={'user':user,'goods':goods})

#登录
def login(request):
    if request.method == 'GET':
        return render(request, 'login/login.html')
    elif request.method == 'POST':
        phone = request.POST.get('phone')
        password = request.POST.get('password')
        password = password_md5(password)
        users = Users.objects.filter(phone=phone)
        if users.exists():
            user = users.first()
            if password == user.password:
                token = random_token()
                request.session['token'] = token
                cache.set(token,user.phone,timeout=60*60)

                return redirect('app:index')
            else:
                return render(request, 'login/login.html', context={'err_password': '密码错误'})

        else:
            return render(request,'login/login.html',context={'err_phone':'手机号码错误'})



def random_token():
    token = str(random.random()) + str(time.time())
    md5 = hashlib.md5()
    md5.update(token.encode('utf-8'))
    token = md5.hexdigest()
    print(token)
    return token

def password_md5(src):
    md5 = hashlib.md5()
    md5.update(str.encode('utf-8'))
    password = md5.hexdigest()
    return password


#注册
def register(request):
    if request.method == 'GET':
        return render(request,'register/register.html')
    elif request.method == 'POST':
        name = request.POST.get('name')
        password = request.POST.get('password')
        phone = request.POST.get('phone')

        user = Users()
        user.name = name
        user.password = password_md5(password)
        user.phone = phone
        user.save()
        token = random_token()
        request.session['token'] = token
        cache.set(token,user.phone,timeout=60*60)

        return redirect('app:index')

#退出
def logout(request):
    return render(request,'index/index.html')

#超市
def supermarket(request):
    return render(request,'supermarket/supermarket.html')

#商品详情
def goods(request,gid):
    good = Goods.objects.get(pk=gid)

    token = request.session.get('token')
    phone = cache.get(token)
    print('goods', good, token,phone)
    num = None
    user = None
    if phone:
        user = Users.objects.get(phone=phone)
        print(user.phone)
        try:
            carts = Carts.objects.filter(user=user).filter(goods=good)
            carts = carts.last()
            num = carts.c_number
            print('由用户，有购物车，有商品')
        except:
            print('没有商品或用户')

    return render(request,'goods/goods.html',context={'goods':good,'user':user,'num':num})



  #购物车
def carts(request):
    return render(request,'carts/carts.html')


#加入商品
def addgoods(request,goodsid):
    goods = Goods.objects.get(pk=goodsid)
    token = request.session.get('token')
    phone = cache.get(token)
    user = Users.objects.get(phone=phone)
    print(user.phone,goods.id)

    try:
        carts = Carts.objects.filter(user=user).filter(goods=goods)
        carts = carts.last()
        carts.c_number = carts.c_number + 1
        carts.save()
        num = carts.c_number
    except:
        cart = Carts()
        cart.user = user
        cart.goods = goods
        cart.save()
        num = cart.c_number

    return JsonResponse({'num':num})