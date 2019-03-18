from django.db import models
from django.db.models import Manager

# Create your models here.
from django.forms import DateTimeField


class Users(models.Model):
    name = models.CharField(max_length=40)
    phone = models.CharField(max_length=20,unique=True)
    password = models.CharField(max_length=40)
    createtime = models.DateTimeField(auto_now=True)
    user_img = models.CharField(max_length=100,default='icon_index_02.png')

    class Meta:
        db_table = 'user'


class Goods(models.Model):
    g_name = models.CharField(max_length=40)
    g_img = models.CharField(max_length=100)
    g_price = models.FloatField()

    class Meta:
        db_table = 'goods'

class CartsManage(Manager):
    # 重写系统方法
    def all(self):
        return super().all().exclude(c_delete=True)

class OrderdetailManager(Manager):
    def all(self):
        return super().all().exclude(isdelete=True)


class Carts(models.Model):
    user = models.ForeignKey(Users)
    goods = models.ForeignKey(Goods)
    c_number = models.IntegerField(default=1)
    c_is = models.BooleanField(default=True)
    c_delete = models.BooleanField(default=False)
    mine_object = CartsManage()

    class Meta:
        db_table = 'carts'



class Orders(models.Model):
    number = models.CharField(max_length=256)
    user = models.ForeignKey(Users)
    #下单时间
    createtime = models.DateTimeField(auto_now_add=True)
    #更新时间
    updatetime = models.DateTimeField(auto_now=True)
    # -1 过期
    # 0 未付款
    # 1 已付款，待发货
    # 2 已发货，待收货
    # 3 已收货，待评价
    # 4 已评价
    status = models.IntegerField(default=0)
    isdelete = models.BooleanField(default=False)
    my_objects = OrderdetailManager()

    class Meta:
        db_table = 'orders'


class Orderdetail(models.Model):
    #订单
    orders = models.ForeignKey(Orders)
    #商品
    goods = models.ForeignKey(Goods)
    #是否删除
    isdelete = models.BooleanField(default=False)
    #数量
    num = models.IntegerField()
    my_objects = OrderdetailManager()

    class Meta:
        db_table = 'orderdetail'