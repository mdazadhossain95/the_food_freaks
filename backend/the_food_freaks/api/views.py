from django.shortcuts import render
from .serializer import *
from .models import *
from rest_framework.views import APIView
from rest_framework.response import Response
# to work with auth token 
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
# Create your views here.
class RegisterView(APIView):
    def post(self, request):
        serializers = UserSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response({'error': False})
        return Response({'error': True})
    
class ProductView(APIView):
    # authenticating user 
    permission_classes = (IsAuthenticated,)
    authentication_classes = (TokenAuthentication,)
    
    def get(self, request):
        query = Product.objects.all()
        # many=true is: here we can have many product or object using query
        serializers = ProductSerializer(query, many=True)
        # checking is Favorite of a product
        data = []
        for product in serializers.data:
            fab_query = Favorite.objects.filter(user=request.user).filter(
                product_id = product['id']
            ) 
            if fab_query:
                product['favorite'] = fab_query[0].isFavorite
            else:
                product['favorite'] = False
            data.append(product)
        
        # sending response as json file
        return Response(data)


class FavoriteView(APIView):
    # authenticating user 
    permission_classes = (IsAuthenticated,)
    authentication_classes = (TokenAuthentication,)
    
    def post(self, request):
        data = request.data['id']
        print(data)
        try:
            product_obj = Product.objects.get(id=data)
            user = request.user
            single_favorite_product = Favorite.objects.filter(user=user).filter(
                product=product_obj
            ).first()
            
            if single_favorite_product:
                ccc = single_favorite_product.isFavorite
                single_favorite_product.isFavorite = not ccc
                single_favorite_product.save()
            else:
                Favorite.objects.create(
                    product=product_obj, user=user, isFavorite=True
                )
            response_msg = {'error': False}
        except:
            response_msg = {'error': True}
        return Response(response_msg)