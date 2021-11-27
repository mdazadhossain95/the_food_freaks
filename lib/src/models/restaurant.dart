class Restaurant {
  late int id;
  late String name;
  late String image;
  late String date;
  late double rating;
  late String description;

  Restaurant(
      {required this.id,
      required this.name,
      required this.image,
      required this.date,
      required this.rating,
      required this.description});

  Restaurant.fromJson(Map<String, dynamic> json) {
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
