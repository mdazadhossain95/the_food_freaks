from django.contrib import admin
from .models import Product, Favorite, Category, Restaurant
# Register your models here.
admin.site.register([Product, Favorite, Category, Restaurant])