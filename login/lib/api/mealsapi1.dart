// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:login/models/meals.dart';

// // This is the file that Codelab users will primarily work on.

// Stream<QuerySnapshot> loadAllMeals() {
//   return Firestore.instance
//       .collection('meals')
//       .orderBy('avgRating', descending: true)
//       .limit(50)
//       .snapshots();
// }

// List<Meals> getRestaurantsFromQuery(QuerySnapshot snapshot) {
//   return snapshot.docs.map((DocumentSnapshot doc) {
//     return Meals.fromSnapshot(doc);
//   }).toList();
// }

// Future<Meals> getRestaurant(String restaurantId) {
//   return Firestore.instance
//       .collection('meals')
//       .doc(restaurantId)
//       .get()
//       .then((DocumentSnapshot doc) => Meals.fromSnapshot(doc));
// }

// Future<void> addReview({String restaurantId, Review review}) {
//   // TODO: Complete the "Write data in a transaction" step.
//   return Future.value();
// }

// Stream<QuerySnapshot> loadFilteredRestaurants(Filter filter) {
//   Query collection = Firestore.instance.collection('restaurants');
//   if (filter.category != null) {
//     collection = collection.where('category', isEqualTo: filter.category);
//   }
//   if (filter.city != null) {
//     collection = collection.where('city', isEqualTo: filter.city);
//   }
//   if (filter.price != null) {
//     collection = collection.where('price', isEqualTo: filter.price);
//   }
//   return collection
//       .orderBy(filter.sort ?? 'avgRating', descending: true)
//       .limit(50)
//       .snapshots();
// }

// void addRestaurantsBatch(List<Restaurant> restaurants) {
//   restaurants.forEach((Restaurant restaurant) {
//     addRestaurant(restaurant);
//   });
// }
