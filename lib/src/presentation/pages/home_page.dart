import 'package:flutter/material.dart';
import 'package:food_order_app/services/firebase_getter_methods.dart';
import 'package:food_order_app/src/presentation/widgets/navigation/main_bottom_nav.dart';
import 'package:food_order_app/src/presentation/widgets/sliders/main_slider_home.dart';
import 'package:food_order_app/theme/font_styles/anta_styles.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

import '../widgets/cards/restaurant_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late String username;

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    username = await UserService().getUsername();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavClass(navigatorKey: navigatorKey).BottomNavBar(context),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: AppBar(
            elevation: 4.0,
            title: Text(
              'DeliverEase',
              style: AntStyler().headingStyle(),
            ),
            backgroundColor: const Color.fromRGBO(24, 178, 255, 1),
          ),
        ),
      ),
      body: FutureBuilder<List<Widget>>(
        future: ReturnRestaurantsRecords().returnRestaurants(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No restaurants found!'));
          } else {
            return ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello $username!',
                        style: AntStyler().h1Style(),
                      ),
                      Text(
                        'What do you crave for today?',
                        style: AntStyler().h2Style(),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'You have recently liked these specialties',
                        style: PoppinsStyles().regularText(),
                      ),
                      SizedBox(height: 10),
                      MainSliderWidget(
                        items: [
                          SliderItem(
                            imgPath: 'lib/res/images/food-minis/kebab-2.jpg',
                            title: 'Kebab',
                          ),
                          SliderItem(
                            imgPath:
                                'lib/res/images/food-minis/rodzaje-sushi-sushi-friends.jpeg',
                            title: 'Sushi',
                          ),
                          SliderItem(
                            imgPath:
                                'lib/res/images/food-minis/domowa-pizza748835.avif',
                            title: 'Pizza',
                          ),
                          SliderItem(
                            imgPath: 'lib/res/images/food-minis/tacos.jpg',
                            title: 'Tacos',
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text('Currently Trending', style: AntStyler().h1Style()),
                      SizedBox(height: 15),
                      ...snapshot.data!, // Spread the list of widgets
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
