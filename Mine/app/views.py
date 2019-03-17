import hashlib
import random

import time

from django.core.cache import cache
from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.


# 主页
from app.models import *


def index(request):
    token = request.session.get('token')
    phone = cache.get(token)

    goods = Goods.objects.all()

    user = None
    if phone:
        user = Users.objects.get(phone=phone)

    return render(request, 'index/index.html', context={'user': user, 'goods': goods})


# 登录
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
                cache.set(token, user.phone, timeout=60 * 60)

                return redirect('app:index')
            else:
                return render(request, 'login/login.html', context={'err_password': '密码错误'})

        else:
            return render(request, 'login/login.html', context={'err_phone': '手机号码错误'})


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


# 注册
def register(request):
    if request.method == 'GET':
        return render(request, 'register/register.html')
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
        cache.set(token, user.phone, timeout=60 * 60)

        return redirect('app:index')


# 退出
def logout(request):
    return render(request, 'index/index.html')


# 超市
def supermarket(request):
    return render(request, 'supermarket/supermarket.html')


# 商品详情
def goods(request, gid):
    good = Goods.objects.get(pk=gid)

    token = request.session.get('token')
    phone = cache.get(token)
    print('goods', good, token, phone)
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
    temp = {
        'goods': good,
        'user': user,
        'num': num
    }

    return render(request, 'goods/goods.html', context=temp)


# 购物车
def carts(request):
    token = request.session.get('token')
    phone = cache.get(token)
    carts = None
    num = 0
    if phone:
        user = Users.objects.get(phone=phone)
        carts = Carts.mine_object.filter(user=user).exclude(c_delete=True)
        num = carts.count()
    response_data = {
        'carts': carts,
        'num': num,

    }
    print(response_data)
    return render(request, 'carts/carts.html', context=response_data)


# 加入商品
def addgoods(request, goodsid):
    goods = Goods.objects.get(pk=goodsid)
    token = request.session.get('token')
    phone = cache.get(token)
    user = Users.objects.get(phone=phone)
    print(user.phone, goods.id)

    num = int(request.GET.get('num'))

    try:
        carts = Carts.mine_object.filter(user=user).filter(goods=goods)
        carts = carts.last()
        if carts.c_delete:
            carts.c_delete = False
            carts.c_number = num
        else:
            carts.c_number = carts.c_number + num
        carts.save()
        num = carts.c_number
        response_data = {
            'sta': 1,
            'num': num,
        }
    except:
        cart = Carts()
        cart.user = user
        cart.goods = goods
        cart.c_number = num
        cart.save()
        num = cart.c_number

        response_data = {
            'sta': 0,
            'num': num,
        }

    return JsonResponse(response_data)



    # 减操作
def minus_carts_goods(request):
    token = request.session.get('token')
    phone = cache.get(token)
    user = Users.objects.get(phone=phone)
    cartsid = request.GET.get('cartsid')
    request_num = int(request.GET.get('num'))
    carts = Carts.mine_object.get(pk=cartsid)
    if request_num == 1:
        carts.c_delete = True
        carts.c_number = 0
    else:
        carts.c_number = carts.c_number - 1
    carts.save()
    num = carts.c_number
    carts = user.carts_set.all()
    counts = carts.exclude(c_delete=True).count()

    response_data = {
        'status': 1,
        'num': num,
        'counts':counts
    }
    return JsonResponse(response_data)


# 加操作
def add_carts_goods(request):
    token = request.session.get('token')
    phone = cache.get(token)
    print(phone)
    user = Users.objects.get(phone=phone)
    cartsid = request.GET.get('cartsid')
    carts = Carts.mine_object.get(pk=cartsid)
    carts.c_number = carts.c_number + 1
    carts.save()
    num = carts.c_number
    carts = user.carts_set.all()
    counts = carts.exclude(c_delete=True).count()



    response_data = {
        'status': 1,
        'num': num,
        'counts':counts
    }
    return JsonResponse(response_data)


# 删除商品操作
def remove_carts_goods(request):
    token = request.session.get('token')
    phone = cache.get(token)
    user = Users.objects.get(phone=phone)
    cartsid = request.GET.get('cartsid')
    carts = Carts.mine_object.get(pk=cartsid)
    carts.c_delete = True
    carts.save()
    carts = user.carts_set.all()
    counts = carts.exclude(c_delete=True).count()
    response_data = {
        'status': 1,
        'counts':counts
    }
    return JsonResponse(response_data)

def random_orders():
    orders = random.random
    return orders

#生成订单
def createorders(request):
    token = request.session.get('token')
    phone = cache.get(token)
    user = Users.objects.get(phone=phone)

    orders = Orders()
    orders.number =random_orders()
    orders.user = user
    orders.save()


    cartslist = user.carts_set.all()
    for cart in cartslist:
        ordersdetail=Orderdetail()
        ordersdetail.orders = orders
        ordersdetail.goods = Goods.objects.get(pk=cart.goods_id)
        ordersdetail.num = cart.c_number
        ordersdetail.save()
        # cart.c_delete = True
        cart.save()

    orderslist = orders.orderdetail_set.all().exclude(isdelete=True)
    print(orders.status,type(orders.status))

    response_data = {
        'orderslist': orderslist,
        'order': orders,
    }

    return render(request,'orders/ordersdetail.html',response_data)

# 订单列表
def orders(request):
    return render(request, 'orders/order.html')

#查看订单
def ordersdetail(request):


    return render(request, 'orders/ordersdetail.html')


def remove_orders_goods(request):
    ordersdetail_id = int(request.GET.get('ordersdetail_id'))
    print(ordersdetail_id)
    ordersdetail = Orderdetail.my_objects.get(pk=ordersdetail_id)
    ordersdetail.isdelete = True
    ordersdetail.save()

    response_data = {
        'status':1,
        'isdelete':ordersdetail.isdelete
    }
    return JsonResponse(response_data)