import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_order_app/src/presentation/pages/profile_sub_pages/current_orders_sub_page.dart';
import 'package:food_order_app/src/presentation/pages/profile_sub_pages/famili_page.dart';
import 'package:food_order_app/src/presentation/widgets/cards/profile_item_tab.dart';
import 'package:food_order_app/src/presentation/widgets/cards/profile_item_tab_minimal.dart';
import 'package:food_order_app/theme/font_styles/anta_styles.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AntStyler().h1Style(),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jakub Pajak',
                      style: AntStyler().h1Style(),
                    ),
                    Image.asset(
                      'lib/res/images/other/user-placeholder.jpg',
                      height: 70,
                      width: 70,
                    ),
                  ],
                ),
                Text(
                  'Loyality level: 2',
                  style: PoppinsStyles().regularText(),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return CurrentOrderSubPage();
                          },
                        );
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.help, size: 30),
                              Text(
                                'Help',
                                style: PoppinsStyles().semiBold(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.wallet, size: 30),
                            Text(
                              'Wallet',
                              style: PoppinsStyles().semiBold(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.shopping_bag, size: 30),
                            Text(
                              'Orders',
                              style: PoppinsStyles().semiBold(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                profileItemTab(
                    context,
                    'DeliveryEase Premium',
                    'Checkout the premium version with free delivery and more !',
                    'lib/res/images/icons/premium-icon1.png',
                    1),
                profileItemTab(
                    context,
                    'DeliverEase Proffesional',
                    'If you want to set up proffesional account this is the perfect place',
                    'lib/res/images/icons/prof-icon.png',
                    2),
                profileItemTabMinimal(
                    context,
                    'User Information',
                    'Check info about your profile data',
                    const Icon(Icons.person_2_outlined),
                    1),
                profileItemTabMinimal(context, 'Edit profile',
                    'Edit info about your profile', const Icon(Icons.edit), 4),
                profileItemTabMinimal(context, 'Order history',
                    'Checkout your order history', Icon(Icons.history), 3),
                profileItemTabMinimal(
                    context,
                    'Badges and Achivements',
                    'See your achivements and you loyality level!',
                    const Icon(Icons.money_off_csred_rounded),
                    4),
                profileItemTabMinimal(
                    context,
                    'Log Out',
                    'Hope to see you soon!',
                    const Icon(Icons.logout_outlined),
                    5),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
