class Product {
  late final String? name;
  late final String? imgPath;
  late final String? rating;
  late final String? price;
  late final String? vendor;
  late final int? added;
  late final bool isFavorite;
  late final String? description;

  Product({this.name,
    this.imgPath,
    this.rating,
    this.price,
    this.vendor,
    this.added,
    this.description,
    required this.isFavorite});

  Product.fromJson(Map<String, dynamic> json){
    name = json['name'];
    imgPath = json['imgPath'];
    rating = json['rating'];
    price = json['price'];
    vendor = json['Vendor'];
    added = json['added'];
    isFavorite = json['isFavorite'];
    description = json['description'];


  }
}
