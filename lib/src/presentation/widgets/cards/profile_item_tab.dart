import 'package:flutter/material.dart';
import 'package:food_order_app/src/presentation/pages/profile_sub_pages/premium_join_sub_page.dart';
import 'package:food_order_app/src/presentation/pages/profile_sub_pages/professional_join_sub_page.dart';
import 'package:food_order_app/theme/font_styles/anta_styles.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

Widget profileItemTab(BuildContext context, String title, String desc,
    String imgPath, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            switch (index) {
              case 1:
                return PremiumJoinPage();
              case 2:
                return ProfessionalJoinPage();
            }
            return ProfessionalJoinPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.bounceInOut,
              )),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 300),
        ),
      );
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromARGB(46, 69, 231, 228),
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AntStyler().h2Style(),
                ),
                Text(
                  desc,
                  style: PoppinsStyles().regularText(),
                )
              ],
            ),
          ),
          Image.asset(
            imgPath,
            height: 60,
            width: 60,
          ),
        ],
      ),
    ),
  );
}
