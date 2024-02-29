import 'package:flutter/material.dart';

class BottomNavClass {
  Widget BottomNavBar() {
    return SizedBox(
      height: 100,
      child: BottomNavigationBar(
        elevation: 10.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
