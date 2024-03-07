import 'package:flutter/material.dart';
import 'package:food_order_app/models/restaurant_model.dart';
import 'package:food_order_app/services/firebase_getter_methods.dart';
import 'package:food_order_app/services/firestore_restaurant_service.dart';
import 'package:food_order_app/theme/font_styles/anta_styles.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

class ReturnRestaurantsRecords {
  Future<List<Widget>> returnRestaurants(BuildContext context) async {
    final List<Widget> restaurantsWidgets = [];

    try {
      final List<Restaurant> restaurants = await getRestaurants().first;

      restaurants.forEach((restaurant) {
        final Widget restaurantWidget = Material(
          elevation: 1.0,
          child: Container(
            padding: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    restaurant.imgPath,
                    fit: BoxFit.cover,
                  ),
                  height: 120,
                  width: double.infinity,
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(restaurant.name, style: AntStyler().h2Style()),
                          Row(
                            children: [
                              Icon(Icons.star),
                              Text(
                                restaurant.rating.toString(),
                                style: PoppinsStyles().regularText(),
                              ),
                              Text(
                                ' (${restaurant.rewievCount.toString()})',
                                style: PoppinsStyles().regularText(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(restaurant.address,
                          style: PoppinsStyles().regularText()),
                      Row(
                        children: [
                          Icon(Icons.lock_clock,
                              size: 18, color: Colors.black26),
                          Text('10.00 zł', style: PoppinsStyles().smallInfo()),
                          SizedBox(width: 15),
                          Icon(Icons.delivery_dining,
                              size: 18, color: Colors.black26),
                          Text('${restaurant.deliveryTime} min',
                              style: PoppinsStyles().smallInfo()),
                          SizedBox(width: 15),
                          Icon(Icons.shopping_bag_sharp,
                              size: 18, color: Colors.black26),
                          Text('${restaurant.minOrderValue} zł',
                              style: PoppinsStyles().smallInfo()),
                        ],
                      ),
                      Text('Free shipping above 120 zł!',
                          style: PoppinsStyles().smallInfo()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        restaurantsWidgets.add(restaurantWidget);
      });
    } catch (e) {
      print('Error fetching restaurants: $e');
    }

    return restaurantsWidgets;
  }
}
