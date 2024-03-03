import 'package:flutter/material.dart';
import 'package:food_order_app/services/firebase_getter_methods.dart';
import 'package:food_order_app/src/presentation/widgets/cards/main_list_card.dart';
import 'package:food_order_app/src/presentation/widgets/cards/restaurant_cards.dart';
import 'package:food_order_app/src/presentation/widgets/navigation/main_bottom_nav.dart';
import 'package:food_order_app/src/presentation/widgets/sliders/main_slider_home.dart';
import 'package:food_order_app/theme/font_styles/anta_styles.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late String username;

  @override
  void initState() {
    username = UserService().getUsername();
    super.initState();
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
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
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
                const SizedBox(height: 10),
                Text(
                  'You have recently liked these specialties',
                  style: PoppinsStyles().regularText(),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 15),
                Text('Currently Trending', style: AntStyler().h1Style()),
                SizedBox(height: 15), // Add spacing between text and cards
                ReturnRestaurantsRecords().returnRestaurants(context),
              ],
            ),
          );
        },
      ),
    );
  }
}
