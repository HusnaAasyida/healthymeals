class Moments {
  String id;
  String name;
  String category;
  String description;
  String type;
  int serving;
  String image;

  Moments();

  Moments.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    description = data['description'];
    type = data['type'];
    serving = data['serving'];
    image = data['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'type': type,
      'serving': serving,
      'image': image,
    };
  }
}
