class Product {
  late int? id;
  late String title;
  late String vendor;
  late int price;
  late int quantity;
  late String image;
  late String date;
  late double rateing;
  late String description;
  late Category category;
  late bool favorite;

  Product(
      {this.id,
      required this.title,
      required this.vendor,
      required this.price,
      required this.quantity,
      required this.image,
      required this.date,
      required this.rateing,
      required this.description,
      required this.category,
      required this.favorite});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    vendor = json['vendor'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    date = json['date'];
    rateing = json['rateing'];
    description = json['description'];
    category = (json['category'] != null
        ? new Category.fromJson(json['category'])
        : null)!;
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['vendor'] = this.vendor;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['date'] = this.date;
    data['rateing'] = this.rateing;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['favorite'] = this.favorite;
    return data;
  }
}

class Category {
  late int? id;
  late String title;
  late String date;

  Category({this.id, required this.title, required this.date});

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
