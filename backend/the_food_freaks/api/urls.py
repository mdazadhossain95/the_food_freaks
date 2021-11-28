from django.urls import path
# login 
from .views import *
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('login/', obtain_auth_token),
    path('register/', RegisterView.as_view()),
    path('products/', ProductView.as_view()),
    path('favorite/', FavoriteView.as_view()),
    path('restaurant/', RestaurantView.as_view()),
    path('productbyrestaurant/', ProductsByRestaurantView.as_view()),
    path('searchproduct/', SearchProduct.as_view()),
]