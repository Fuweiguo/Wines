# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-17 13:14
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0011_orders'),
    ]

    operations = [
        migrations.CreateModel(
            name='Orderdetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('isdelete', models.BooleanField(default=False)),
                ('num', models.IntegerField()),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Goods')),
                ('orders', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Orders')),
            ],
            options={
                'db_table': 'drderdetail',
            },
        ),
    ]
