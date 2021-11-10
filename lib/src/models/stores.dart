class Stores {

  late final String? storeName;
  late final String? storeImgPath;

  late final String? name;
  late final String? imgPath;
  late final String? rating;
  late final String? price;
  late final int? added;
  // late final bool isFavorite;
  late final String? description;

  Stores({
    this.storeName,
    this.storeImgPath,

    this.name,
    this.imgPath,
    this.rating,
    this.price,
    this.added,
    this.description,
    // required this.isFavorite

  });

  Stores.fromJson(Map<String, dynamic> json){
    storeName = json['storeName'];
    storeImgPath = json['storeImgPath'];

    name = json['name'];
    imgPath = json['imgPath'];
    rating = json['rating'];
    price = json['price'];
    added = json['added'];
    // isFavorite = json['isFavorite'];
    description = json['description'];


  }
}
