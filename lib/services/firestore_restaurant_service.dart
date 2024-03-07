import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_order_app/models/restaurant_model.dart';

Future<void> addRestaurant(Restaurant restaurant) async {
  try {
    await FirebaseFirestore.instance.collection('restaurants').add({
      'name': restaurant.name,
      'address': restaurant.address,
      'rating': restaurant.rating,
      'categories': restaurant.categories,
      'deliveryTime': restaurant.deliveryTime,
      'minOrderValue': restaurant.minOrderValue,
      'rewievCount': restaurant.rewievCount,
    });
  } catch (e) {
    print('Failed to add restaurant: $e');
  }
}

Stream<List<Restaurant>> getRestaurants() {
  return FirebaseFirestore.instance
      .collection('restaurants')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      return Restaurant(
        name: doc['name'],
        address: doc['address'],
        rating: doc['rating'],
        imgPath: doc['imgPath'],
        categories: doc['categories'],
        deliveryTime: doc['deliveryTime'],
        minOrderValue: doc['minOrderValue'],
        rewievCount: doc['rewievCount'],
      );
    }).toList();
  });
}

Stream<double> getRestaurantsCount() {
  return FirebaseFirestore.instance
      .collection('restaurants')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.length.toDouble(); // Convert length to double
  });
}
