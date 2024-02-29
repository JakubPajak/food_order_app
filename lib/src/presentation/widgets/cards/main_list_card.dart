import 'package:flutter/material.dart';
import 'package:food_order_app/theme/font_styles/anta_styles.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

class MainMenuCard extends StatefulWidget {
  const MainMenuCard({super.key});

  @override
  State<MainMenuCard> createState() => _MainMenuCardState();
}

class _MainMenuCardState extends State<MainMenuCard> {
  @override
  Widget build(BuildContext context) {
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
                'lib/res/images/food-minis/kebab-2.jpg',
                fit: BoxFit.cover,
              ),
              height: 120,
              width: double.infinity,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Kapadokya Kebap', style: AntStyler().h2Style()),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.star),
                            Text('4,3', style: PoppinsStyles().regularText()),
                            Text('(20)', style: PoppinsStyles().regularText()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text('kebab, libańska', style: PoppinsStyles().regularText()),
                  Row(
                    children: [
                      Icon(
                        Icons.lock_clock,
                        size: 18,
                        color: Colors.black26,
                      ),
                      Text('10.00 zł', style: PoppinsStyles().smallInfo()),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.delivery_dining,
                        size: 18,
                        color: Colors.black26,
                      ),
                      Text('Min. 70,00 zł', style: PoppinsStyles().smallInfo()),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.shopping_bag_sharp,
                        size: 18,
                        color: Colors.black26,
                      ),
                      Text('25-50 min', style: PoppinsStyles().smallInfo())
                    ],
                  ),
                  Text('Free shipping above 120 zł!',
                      style: PoppinsStyles().smallInfo())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
