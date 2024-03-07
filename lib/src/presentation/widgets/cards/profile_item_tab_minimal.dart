import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_order_app/src/presentation/pages/login_page.dart';
import 'package:food_order_app/src/presentation/pages/profile_sub_pages/achivements_page.dart';
import 'package:food_order_app/src/presentation/pages/profile_sub_pages/edit_profile_page.dart';
import 'package:food_order_app/src/presentation/pages/profile_sub_pages/famili_page.dart';
import 'package:food_order_app/src/presentation/pages/profile_sub_pages/order_history_page.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

profileItemTabMinimal(
    BuildContext context, String title, String desc, Icon icon, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            switch (index) {
              case 1:
                return FamilyPage();
              case 2:
                return EditProfilePage();
              case 3:
                return OrderHistoryPage();
              case 4:
                return AchivementsPage();
              case 5:
                return LoginPage();
            }
            return FamilyPage();
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
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15),
        child: Container(
          width: MediaQuery.of(context).size.width - 15,
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: PoppinsStyles().semiBold(),
                    ),
                    Text(
                      desc,
                      style: PoppinsStyles().regularText(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
