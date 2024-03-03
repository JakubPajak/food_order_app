import 'package:flutter/material.dart';
import 'package:food_order_app/models/restaurant_model.dart';
import 'package:food_order_app/services/firestore_restaurant_service.dart';
import 'package:food_order_app/theme/font_styles/anta_styles.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

class ReturnRestaurantsRecords {
  Widget returnRestaurants(BuildContext context) {
    return SizedBox(
      height: 600,
      child: StreamBuilder<List<Restaurant>>(
        stream: getRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData) {
            return Text('No restaurants found!');
          }

          return Expanded(
            child: Column(
              children: snapshot.data!.map((restaurant) {
                return Material(
                  elevation: 1.0,
                  child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(restaurant.name,
                                      style: AntStyler().h2Style()),
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
                                  Text('10.00 zł',
                                      style: PoppinsStyles().smallInfo()),
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
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
