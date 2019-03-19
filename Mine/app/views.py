import hashlib
import random
import io
import time
from urllib.parse import parse_qs

import os
from PIL import Image, ImageDraw, ImageFont

from django.core.cache import cache
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect

# Create your views here.



from django.views.decorators.csrf import csrf_exempt

from Mine.settings import BASE_DIR
from app.alipay import alipay
from app.models import *

#主页
def index(request):
    token = request.session.get('token')
    phone = cache.get(token)

    goods = Goods.objects.all()

    user = None
    num = 0
    if phone:
        user = Users.objects.get(phone=phone)
        num = user.carts_set.all().count()

    return render(request, 'index/index.html', context={'user': user, 'goods': goods,'num':num})

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

#验证是否已被注册
def is_register(request):
    phone = request.GET.get('phone')
    user = Users.objects.filter(phone=phone)
    if user:
        response_data = {
            'msg': 1,
            'status':'该号码已被注册'
        }
    else:
        response_data = {
            'msg': 0,
            'status':''
        }
    return JsonResponse(response_data)


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

def verifyconde(request):
    #定义图片大小
    width = 110
    height = 38

    #定义图片颜色
    bgcolor = (random.randrange(0,256),random.randrange(0,256),random.randrange(0,256))

    image = Image.new('RGB',(width,height),bgcolor)

    draw = ImageDraw.Draw(image)

    for a in range(0,50):
        xy =(random.randrange(0,width),random.randrange(0,height))
        fill = (random.randrange(0,256),random.randrange(0,256),random.randrange(0,256))
        draw.point(xy=xy,fill=fill)

    for i in range(5):
        x1 = random.randint(0, width)
        x2 = random.randint(0, width)
        y1 = random.randint(0, height)
        y2 = random.randint(0, height)
        draw.line((x1, y1, x2, y2), fill=(random.randrange(0,256),random.randrange(0,256),random.randrange(0,256)))

    #随机生成（验证码）
    temp = '121234567890poiuytrewlkjhgfdsamnbvcxzQWERTYUIOJHGFDSXCVBNM'
    random_str = ''
    for i in range(0,4):
        random_str += temp[random.randrange(0,len(temp))]

    cache.set('random_str',random_str,60)

    #字体类型
    fontPath = os.path.join(BASE_DIR,'app/fonts/Fangsong.ttf')
    font = ImageFont.truetype(fontPath,25)

    #字体颜色
    font_color_1 = (random.randrange(0,156),random.randrange(0,156),random.randrange(0,156))
    font_color_2 = (random.randrange(0, 156), random.randrange(0, 156), random.randrange(0, 156))
    font_color_3 = (random.randrange(0, 156), random.randrange(0, 156), random.randrange(0, 156))
    font_color_4 = (random.randrange(0, 156), random.randrange(0, 156), random.randrange(0, 156))

    #绘制
    draw.text((10,5),random_str[0], fill=font_color_1,font=font)
    draw.text((35, 5), random_str[1], fill=font_color_2, font=font)
    draw.text((60, 5), random_str[2], fill=font_color_3, font=font)
    draw.text((85, 5), random_str[3], fill=font_color_4, font=font)


    del draw

    buff = io.BytesIO()
    image.save(buff,'png')

    return HttpResponse(buff.getvalue(),'image/png')

def update_code(request):
    name = request.GET.get('name')
    phone = request.GET.get('phone')
    password = request.GET.get('password')
    print(name,phone,password)

    response_data = {
        'msg':1,
        'u__name':name,
        'u_phone':phone,
        'u_passwrod':password,
    }
    return JsonResponse(response_data)


# 退出
def logout(request):
    del request.session['token']
    cache.clear()
    return redirect('app:index')


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
    carts_num = 0
    if phone:
        user = Users.objects.get(phone=phone)
        print(user.phone)
        carts_num = user.carts_set.all().count()
        try:
            carts = Carts.objects.filter(user=user).filter(goods=good).exclude(c_delete=True)
            carts = carts.last()
            num = carts.c_number
            print('由用户，有购物车，有商品')
        except:
            print('没有商品或用户')
    temp = {
        'goods': good,
        'user': user,
        'num': num,
        'carts_num':carts_num,
    }

    return render(request, 'goods/goods.html', context=temp)


# 购物车
def carts(request):
    token = request.session.get('token')
    phone = cache.get(token)
    carts = None
    user = None
    num = 0
    if phone:
        user = Users.objects.get(phone=phone)
        carts = Carts.mine_object.filter(user=user).exclude(c_delete=True)
        num = carts.count()
    response_data = {
        'carts': carts,
        'num': num,
        'user':user

    }
    print(response_data)
    return render(request, 'carts/carts.html', context=response_data)


# 加入商品
def addgoods(request, goodsid):
    goods = Goods.objects.get(pk=goodsid)
    token = request.session.get('token')
    phone = cache.get(token)
    user = Users.objects.get(phone=phone)
    carts_num = user.carts_set.all().count()

    num = int(request.GET.get('num'))

    try:
        carts = Carts.mine_object.filter(user=user).filter(goods=goods)
        carts = carts.last()
        if carts.c_delete:
            carts.c_delete = False
            carts.c_number = num
            carts.save()
            carts_num = user.carts_set.all().count()
        else:
            carts.c_number = carts.c_number + num
            carts_num = user.carts_set.all().count()
            carts.save()

        num = carts.c_number
        response_data = {
            'sta': 1,
            'num': num,
            'carts_num':carts_num
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
            'carts_num':carts_num
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
    orders = time.time()
    return orders

#生成订单
def createorders(request):
    token = request.session.get('token')
    phone = cache.get(token)
    if phone:

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

            cart.c_delete = True
            cart.save()

        orderslist = orders.orderdetail_set.all().exclude(isdelete=True)
        print(orders.status,type(orders.status))

        response_data = {
            'orderslist': orderslist,
            'order': orders,
        }

        return render(request,'orders/ordersdetail.html',response_data)
    else:
        return redirect('app:carts')
# 订单列表
def orders(request):
    token = request.session.get('token')
    phone = cache.get(token)
    orders = None
    if phone:
        user = Users.objects.get(phone=phone)
        orders = user.orders_set.all()
    return render(request, 'orders/order.html', context={'orders': orders})



#查看订单
def ordersdetail(request,id):
    orders = Orders.my_objects.get(pk=id)
    orderslist = orders.orderdetail_set.all()

    data = {
        'orderslist': orderslist,
        'order': orders,
    }

    return render(request, 'orders/ordersdetail.html',context=data)


#删除订单商品
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

#删除订单
def remove_orders(request):
    orders_id = request.GET.get('orders_id')
    orders = Orders.my_objects.get(pk=orders_id)
    orders.isdelete = True
    orders.save()
    response_data = {
        'status': 0,
    }
    return JsonResponse(response_data)


def randomtest(request):
    temp = random.randrange(100,10000)
    return render(request,'other/randomtest.html',context={'temp':temp})


def returnurl(request):
    # return render(request,'index/index.html')
    return redirect('app:index')


def appnotifyurl(request):
    print('支付成功')
    return JsonResponse({'msg':'success'})


@csrf_exempt
def appontifyurl(request):
    if request.method == 'POST':
        #获取到参数
        body_str = request.body.decode('utf-8')

        #通过parse_qs
        post_data = parse_qs(body_str)

        #转化为字典
        post_dic = {}
        for k,v in post_data.items():
            post_dic[k] = v[0]

        #获取订单号
        out_trade_no = post_dic['out_trade_no']

        #跟新状态
        orders = Orders.objects.filter(number=out_trade_no)
        orders = orders.last()
        orders.status = 1
        orders.save()



    return JsonResponse({'msg': 'success'})



def pay(request):
    # print(request.GET.get('orderid'))

    orders_number = request.GET.get('orders_number')
    order = Orders.my_objects.get(number=orders_number)

    sum = 0
    for orderGoods in order.orderdetail_set.all():
        sum += orderGoods.goods.g_price * orderGoods.num

    # 支付地址信息
    data = alipay.direct_pay(
        subject='MackBookPro [256G 8G 灰色]', # 显示标题
        out_trade_no=order.number,    # 爱鲜蜂 订单号
        total_amount=str(sum),   # 支付金额
        return_url='http://47.92.149.204/returnurl/'
    )


    # 支付地址
    alipay_url = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=data)

    response_data = {
        'msg': '调用支付接口',
        'alipayurl': alipay_url,
        'status': 1
    }

    return JsonResponse(response_data)


def code(request):
    random_str = cache.get('random_str').lower()
    code = request.GET.get('code').lower()
    print(random_str,code)
    if code == random_str:
        #验证成功
        resqponse_data = {
            'msg':1,
            'status':'验证成功'
        }
    else:
        # 验证错误
        resqponse_data = {
            'msg': 0,
            'status':'验证失败'
        }
    return JsonResponse(resqponse_data)


