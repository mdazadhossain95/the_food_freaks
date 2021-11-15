from django.contrib import admin
from .models import Product, Favorite, Category
# Register your models here.
admin.site.register([Product, Favorite, Category])