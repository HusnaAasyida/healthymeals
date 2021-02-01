class Meals {
  String id;
  String name;
  String category;
  String type;
  double calories;
  int carbs;
  int protein;
  int fat;
  int serving;
  String minutes;
  List ingredients = [];
  List directions = [];
  String image;

  Meals();

  Meals.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    type = data['type'];
    calories = data['calories'];
    carbs = data['carbs'];
    protein = data['protein'];
    fat = data['fat'];
    serving = data['serving'];
    minutes = data['minutes'];
    ingredients = data['ingredients'];
    directions = data['directions'];
    image = data['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'type': type,
      'calories': calories,
      'carbs': carbs,
      'protein': protein,
      'fat': fat,
      'serving': serving,
      'minutes': minutes,
      'ingredients': ingredients,
      'directions': directions,
      'image': image,
    };
  }
}
