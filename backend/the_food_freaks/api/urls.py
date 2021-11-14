from django.urls import path
# login 
from .views import *
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('login/', obtain_auth_token),
    path('register/', RegisterView.as_view()),
]