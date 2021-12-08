from django.shortcuts import render
from .serializer import *
from .models import *
from rest_framework.views import APIView
from rest_framework import filters, generics
from django.db.models import Q
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
    
class RestaurantView(APIView):
    # authenticating user 
    permission_classes = (IsAuthenticated,)
    authentication_classes = (TokenAuthentication,)
    
    def get(self, request):
        query = Restaurant.objects.all()
        # many=true is: here we can have many product or object using query
        serializers = RestaurantSerializer(query, many=True)
        # checking is Favorite of a product
        data = []
        for rest in serializers.data:
            data.append(rest)
        
        # sending response as json file
        return Response(data)
    
class ProductsByRestaurantView(APIView):
    # authenticating user 
    permission_classes = (IsAuthenticated,)
    authentication_classes = (TokenAuthentication,)
    
    def get(self, request, *args, **kwargs):
        
        print(request.query_params['id'])
        id = int(request.query_params['id'])
        
        
        query = Product.objects.all()
        serializers = ProductSerializer(query, many=True)
        data = []

        for product in serializers.data:
            fab_query = Favorite.objects.filter(user=request.user).filter(
                product_id = product['id']
            )
            if fab_query:
                product['favorite'] = fab_query[0].isFavorite
            else:
                product['favorite'] = False
                
            if product['vendor']['id'] == id:
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
    
    
class SearchProduct(APIView):
    # authenticating user 
    permission_classes = (IsAuthenticated,)
    authentication_classes = (TokenAuthentication,)
    
    # search_fields = ['title']
    # filter_backends = (filters.SearchFilter,)
    # queryset = Product.objects.all()
    # serializer_class = ProductSerializer
    
    
    def get(self, request, *args, **kwargs):
        
        # print(request.query_params['search'])
        id = request.query_params['search']
        
        
        query = Product.objects.all()
        serializers = ProductSerializer(query, many=True)
        # print(serializers)
        # result = Product.objects.filter(Q(title__contains=id))
        # print(result)
        data = []

        for product in serializers.data:
            fab_query = Favorite.objects.filter(user=request.user).filter(
                product_id = product['id']
            ) 
            if fab_query:
                product['favorite'] = fab_query[0].isFavorite
            else:
                product['favorite'] = False
                
            # print(product)
            if  id in product['title']:  
                data.append(product)
        
        # sending response as json file
        return Response(data)

class CartView(APIView):
    permission_classes = [IsAuthenticated, ]
    authentication_classes = [TokenAuthentication, ]

    def get(self, request):
        user = request.user
        try:
            cart_obj = Cart.objects.filter(user=user).filter(isComplete=False)
            data = []
            cart_serializer = CartSerializers(cart_obj, many=True)
            for cart in cart_serializer.data:
                cart_product_obj = CartProduct.objects.filter(cart=cart["id"])
                cart_product_obj_serializer = CartProductSerializers(
                    cart_product_obj, many=True)
                cart['cartproducts'] = cart_product_obj_serializer.data
                data.append(cart)
            response_msg = {"error": False, "data": data}
        except:
            response_msg = {"error": True, "data": "No Data"}
        return Response(response_msg)    
    
class AddToCart(APIView):
    permission_classes = [IsAuthenticated, ]
    authentication_classes = [TokenAuthentication, ]

    def post(self, request):
        product_id = request.data['id']
        product_obj = Product.objects.get(id=product_id)
        # print(product_obj, "product_obj")
        cart_cart = Cart.objects.filter(
            user=request.user).filter(isComplete=False).first()
        cart_product_obj = CartProduct.objects.filter(
            product__id=product_id).first()

        try:
            if cart_cart:
                print(cart_cart)
                print("OLD CART")
                this_product_in_cart = cart_cart.cartproduct_set.filter(
                    product=product_obj)
                if this_product_in_cart.exists():
                    cartprod_uct = CartProduct.objects.filter(
                        product=product_obj).filter(cart__isComplete=False).first()
                    cartprod_uct.quantity += 1
                    cartprod_uct.subtotal += product_obj.price
                    cartprod_uct.save()
                    cart_cart.total += product_obj.price
                    cart_cart.save()
                else:
                    print("NEW CART PRODUCT CREATED--OLD CART")
                    cart_product_new = CartProduct.objects.create(
                        cart=cart_cart,
                        price=product_obj.price,
                        quantity=1,
                        subtotal=product_obj.price
                    )
                    cart_product_new.product.add(product_obj)
                    cart_cart.total += product_obj.price
                    cart_cart.save()
            else:
                Cart.objects.create(user=request.user,
                                    total=0, isComplete=False)
                new_cart = Cart.objects.filter(
                    user=request.user).filter(isComplete=False).first()
                cart_product_new = CartProduct.objects.create(
                    cart=new_cart,
                    price=product_obj.price,
                    quantity=1,
                    subtotal=product_obj.price
                )
                cart_product_new.product.add(product_obj)
                new_cart.total += product_obj.price
                new_cart.save()
            response_mesage = {
                'error': False, 'message': "Product add to card successfully", "product": product_id}
        except:
            response_mesage = {'error': True,
                               'message': "Product Not add!Somthing is wrong"}
        return Response(response_mesage)
   
class DeleteFromCart(APIView):
    permission_classes = [IsAuthenticated, ]
    authentication_classes = [TokenAuthentication, ]

    def post(self, request):
        product_id = request.data['id']
        product_obj = Product.objects.get(id=product_id)

        cart_cart = Cart.objects.filter(
            user=request.user).filter(isComplete=False).first()
        cart_product_obj = CartProduct.objects.filter(
            product__id=product_id).first()

        try:
            if cart_cart:
                print(cart_cart)
                print("OLD CART")
                this_product_in_cart = cart_cart.cartproduct_set.filter(
                    product=product_obj)
                if this_product_in_cart.exists():
                    cartprod_uct = CartProduct.objects.filter(
                        product=product_obj).filter(cart__isComplete=False).first()
                    cartprod_uct.quantity -= 1
                    cartprod_uct.subtotal -= product_obj.price
                    cartprod_uct.save()
                    cart_cart.total -= product_obj.price
                    cart_cart.save()
            response_mesage = {
                'error': False, 'message': "Product deleted from card successfully", "product": product_id}
        except:
            response_mesage = {'error': True,
                               'message': "Product Not deleted! Somthing is wrong"}
        return Response(response_mesage)
    
class DelateCarProduct(APIView):
    authentication_classes = [TokenAuthentication, ]
    permission_classes = [IsAuthenticated, ]

    def post(self, request):
        cart_product_id = request.data['id']
        print(cart_product_id)
        try:
            cart_product_obj = CartProduct.objects.get(id=cart_product_id)
            print(cart_product_obj)
            cart_cart = Cart.objects.filter(
                user=request.user).filter(isComplete=False).first()
            cart_cart.total -= cart_product_obj.subtotal
            cart_product_obj.delete()
            cart_cart.save()
            response_msg = {'error': False}
        except:
            response_msg = {'error': True}
        return Response(response_msg)    
    
class DelateAllCarProduct(APIView):
    authentication_classes = [TokenAuthentication, ]
    permission_classes = [IsAuthenticated, ]

    def post(self, request):
        cart_obj_id = int(request.data['id'])
        cart = Cart.objects.get(id=cart_obj_id)
        
        try:
            cart_obj = CartProduct.objects.filter(cart_id=cart_obj_id)
            for product_cart in cart_obj:
                product_cart.delete()
            cart.total = 0
            cart.save()
            response_msg = {'error': False}
        except:
            response_msg = {'error': True}
        return Response(response_msg)
    
class DelateCart(APIView):
    permission_classes = [IsAuthenticated, ]
    authentication_classes = [TokenAuthentication, ]

    def post(self, request):
        cart_id = request.data['id']
        try:
            cart_obj = Cart.objects.get(id=cart_id)
            cart_obj.delete()
            response_msg = {'error': False}
        except:
            response_msg = {'error': True}
        return Response(response_msg)