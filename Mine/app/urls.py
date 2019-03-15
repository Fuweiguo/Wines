from django.conf.urls import url

from app import views

urlpatterns = [
    #主页
    url(r'^index/$',views.index,name='index'),
    #登录
    url(r'^login/$',views.login,name='login'),
    #注册
    url(r'^register/$',views.register,name='register'),

    #退出
    url(r'^logout/$',views.logout,name='logout'),

    #超市
    url(r'^supermarket/$',views.supermarket,name='supermarket'),

    #商品详情
    url(r'^goods/(\d)/$',views.goods,name='goods'),

    #购物车
    url(r'^carts/$',views.carts,name='carts'),
    #加入购物车
    url(r'^addgoods/(\d)/$',views.addgoods,name='addgoods'),

]