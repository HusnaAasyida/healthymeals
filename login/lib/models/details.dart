class Details {
  final String username;
  int age;
  final String gender;
  final double weight;
  final double height;
  final double bmi;
  final String comments;
  final double calories;
  final int carbsUser;
  final int proteinUser;
  final int fatUser;
  final double carbsPerDay;
  final double proteinPerDay;
  final double fatPerDay;

  // Details.fromMap(Map<String, dynamic> data) {
  //   username = data['username'];
  //   gender = data['gender'];
  //   weight = data['weight'];
  //   height = data['height'];
  // }

  Details(
      {this.username,
      this.age,
      this.gender,
      this.weight,
      this.height,
      this.bmi,
      this.comments,
      this.calories,
      this.carbsUser,
      this.proteinUser,
      this.fatUser,
      this.carbsPerDay,
      this.proteinPerDay,
      this.fatPerDay});
}
