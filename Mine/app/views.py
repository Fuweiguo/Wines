from django.shortcuts import render

# Create your views here.

#主页
def index(request):
    return render(request, 'index/index.html')

#登录
def login(request):
    return render(request,'login/login.html')


#注册
def register(request):
    return render(request,'register/register.html')

#退出
def logout(request):
    return render(request,'index/index.html')

#超市
def supermarket(request):
    return render(request,'supermarket/supermarket.html')

#商品详情
def goods(request):
    return render(request,'goods/goods.html')

  #购物车
def carts(request):
    return render(request,'carts/carts.html')


