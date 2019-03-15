from django.db import models

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

class Carts(models.Model):
    user = models.ForeignKey(Users)
    goods = models.ForeignKey(Goods)
    c_number = models.IntegerField(default=1)
    c_is = models.BooleanField(default=True)
    c_delete = models.BooleanField(default=False)

    class Meta:
        db_table = 'carts'
