from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
# importing user model from django 
from django.contrib.auth.models import User
class Category(models.Model):
    title = models.CharField(max_length=100)
    date = models.DateField(auto_now_add=True)
    
    def __str__(self):
        return self.title
    
class Restaurant(models.Model):
    Name = models.CharField(max_length=100)
    image = models.ImageField(upload_to='restaurant/')
    date = models.DateField(auto_now_add=True)
    rating = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(5.0)])
    description = models.TextField()
    
    def __str__(self):
        return self.Name
    
class Product(models.Model):
    title = models.CharField(max_length=100)
    vendor = models.ForeignKey(Restaurant, on_delete=models.CASCADE)
    price = models.PositiveBigIntegerField()
    quantity = models.PositiveBigIntegerField()
    image = models.ImageField(upload_to='products/')
    date = models.DateField(auto_now_add=True)
    rating = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(5.0)])
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    description = models.TextField()
    
    
    def __str__(self):
        return self.title
    
class Favorite(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    isFavorite = models.BooleanField(default=False)
    
    def __str__(self):
        return f"ProductID = {self.product.id } user={self.user.username} | IsFavorite = {self.isFavorite}"
    
    
    
