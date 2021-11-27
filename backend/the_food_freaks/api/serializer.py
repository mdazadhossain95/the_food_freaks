from rest_framework import serializers
# from .models import *
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token
from .models import *

User = get_user_model()
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'password', 'first_name', 'last_name', 'email']
        extra_kwargs = {'password': {'write_only': True, 'required': True}}
        
    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        Token.objects.create(user=user)
        return user
    
class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = "__all__"
        # to see inside the category 1 level deep
        depth = 1    
class RestaurantSerializer(serializers.ModelSerializer):
    class Meta:
        model = Restaurant
        fields = "__all__"
        # to see inside the category 1 level deep
        depth = 1