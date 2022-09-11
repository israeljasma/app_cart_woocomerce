class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
    this.image,
  });

  int id;
  String name;
  String description;
  dynamic image;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}
