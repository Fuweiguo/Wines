# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-15 05:01
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('app', '0006_delete_users'),
    ]

    operations = [
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=40)),
                ('phone', models.CharField(max_length=20, unique=True)),
                ('password', models.CharField(max_length=40)),
                ('createtime', models.DateTimeField(auto_now=True)),
                ('user_img', models.CharField(default='icon_index_02.png', max_length=100)),
            ],
            options={
                'db_table': 'user',
            },
        ),
    ]
