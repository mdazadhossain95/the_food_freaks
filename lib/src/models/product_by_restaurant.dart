class RestaurantProduct {
  late int id;
  late String title;
  late int price;
  late int quantity;
  late String image;
  late String date;
  late int rating;
  late String description;
  late Vendor vendor;
  late Category category;

  RestaurantProduct(
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

  RestaurantProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    date = json['date'];
    rating = json['rating'];
    description = json['description'];
    vendor =
        (json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null)!;
    category = (json['category'] != null
        ? new Category.fromJson(json['category'])
        : null)!;
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
    if (this.vendor != null) {
      data['vendor'] = this.vendor.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}

class Vendor {
  late int id;
  late String name;
  late String image;
  late String date;
  late double rating;
  late String description;

  Vendor(
      {required this.id,
      required this.name,
      required this.image,
      required this.date,
      required this.rating,
      required this.description});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    image = json['image'];
    date = json['date'];
    rating = json['rating'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['image'] = this.image;
    data['date'] = this.date;
    data['rating'] = this.rating;
    data['description'] = this.description;
    return data;
  }
}

class Category {
  late int id;
  late String title;
  late String date;

  Category({required this.id, required this.title, required this.date});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    return data;
  }
}
