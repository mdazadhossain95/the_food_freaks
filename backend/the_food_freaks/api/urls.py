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
    path('cart/', CartView.as_view()),
    path('addtocart/', AddToCart.as_view()),
    path('delatecartprod/', DelateCarProduct.as_view()),
    path('delateallcartprod/', DelateAllCarProduct.as_view()),
    path('deletecart/', DelateCart.as_view()),
    path('deletefromcart/', DeleteFromCart.as_view()),
]