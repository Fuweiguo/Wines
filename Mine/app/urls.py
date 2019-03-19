from django.conf.urls import url

from app import views

urlpatterns = [
    # 主页
    url(r'^index/$', views.index, name='index'),
    # 登录
    url(r'^login/$', views.login, name='login'),
    # 注册
    url(r'^register/$', views.register, name='register'),

    #验证功能
    url(r'^code/$',views.code,name='code'),

    #刷新验证码
    url(r'^update_data/$',views.update_code,name='update_code'),

    #验证号码是否已被注册
    url(r'^is_register/$',views.is_register,name='is_register'),

    # 退出
    url(r'^logout/$', views.logout, name='logout'),

    # 超市
    url(r'^supermarket/$', views.supermarket, name='supermarket'),

    # 商品详情
    url(r'^goods/(\d)/$', views.goods, name='goods'),

    # 购物车
    url(r'^carts/$', views.carts, name='carts'),
    # 加入购物车
    url(r'^addgoods/(\d)/$', views.addgoods, name='addgoods'),

    # 减操作
    url(r'^minus_carts_goods/$', views.minus_carts_goods, name='minus_carts_goods'),

    # 加操作
    url(r'^add_carts_goods/$', views.add_carts_goods, name='add_carts_goods'),

    # 删除商品操作
    url(r'^remove_carts_goods/$', views.remove_carts_goods, name='remove_carts_goods'),

    # 生成订单
    url(r'^createorders/$', views.createorders, name='createorders'),

    # 订单列表
    url(r'^orders/$', views.orders, name='orders'),

    # 逻辑删除订单
    url(r'^remove_orders/$', views.remove_orders, name='remove_orders'),

    # 订单详情
    url(r'^ordersdetail/(\d+)/$', views.ordersdetail, name='ordersdetail'),

    # 逻辑删除订单商品
    url(r'^remove_orders_goods/$', views.remove_orders_goods, name='remove_orders_goods'),

    url(r'^randomtest/$', views.randomtest, name='randomtest'),  # 测试接口

    url(r'^returnurl/$', views.returnurl, name='returnurl'),  # 支付成功后，客户端的显示
    url(r'^appnotifyurl/$', views.appnotifyurl, name='appnotifyurl'),  # 支付成功后，订单的处理
    #
    url(r'^pay/$', views.pay, name='pay'),  # 支付

    # 生成验证码
    url(r'^verifyconde/$',views.verifyconde,name='verifyconde'),
]
