from django.contrib import admin
from .models import Product, Favorite, Category, Restaurant, CartProduct, Cart
# Register your models here.
admin.site.register([Product, Favorite, Category, Restaurant, Cart, CartProduct])