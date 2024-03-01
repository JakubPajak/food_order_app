import 'package:flutter/material.dart';

class BottomNavClass {
  final GlobalKey<NavigatorState> navigatorKey;

  BottomNavClass({required this.navigatorKey});

  Widget BottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(
            Icons.home,
            color: Colors.blue,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          activeIcon: Icon(
            Icons.home,
            color: Colors.blue,
          ),
        )
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/search');
            break;
          case 2:
            Navigator.pushNamed(context, '/profile');
            ;
            break;
        }
      },
    );
  }
}
