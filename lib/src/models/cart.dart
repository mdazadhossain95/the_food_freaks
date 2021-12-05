class CartModel {
  late int id;
  late int total;
  late bool isComplete;
  late String date;
  late int user;
  late List<Cartproducts> cartproducts;

  CartModel(
      {required this.id,
      required this.total,
      required this.isComplete,
      required this.date,
      required this.user,
      required this.cartproducts});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    isComplete = json['isComplete'];
    date = json['date'];
    user = json['user'];
    if (json['cartproducts'] != null) {
      cartproducts = <Cartproducts>[];
      json['cartproducts'].forEach((v) {
        cartproducts.add(Cartproducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['isComplete'] = this.isComplete;
    data['date'] = this.date;
    data['user'] = this.user;
    if (this.cartproducts != null) {
      data['cartproducts'] = this.cartproducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cartproducts {
  late int id;
  late int price;
  late int quantity;
  late int subtotal;
  late Cart cart;
  late List<Product> product;

  Cartproducts(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.subtotal,
      required this.cart,
      required this.product});

  Cartproducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    subtotal = json['subtotal'];
    cart = (json['cart'] != null ? new Cart.fromJson(json['cart']) : null)!;
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['subtotal'] = this.subtotal;
    if (this.cart != null) {
      data['cart'] = this.cart.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  late int id;
  late int total;
  late bool isComplete;
  late String date;
  late int user;

  Cart(
      {required this.id,
      required this.total,
      required this.isComplete,
      required this.date,
      required this.user});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    isComplete = json['isComplete'];
    date = json['date'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['isComplete'] = this.isComplete;
    data['date'] = this.date;
    data['user'] = this.user;
    return data;
  }
}

class Product {
  late int id;
  late String title;
  late int price;
  late int quantity;
  late String image;
  late String date;
  late double rating;
  late String description;
  late int vendor;
  late int category;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity,
      required this.image,
      required this.date,
      required this.rating,
      required this.description,
      required this.vendor,
      required this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    date = json['date'];
    rating = json['rating'];
    description = json['description'];
    vendor = json['vendor'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['date'] = this.date;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['vendor'] = this.vendor;
    data['category'] = this.category;
    return data;
  }
}
