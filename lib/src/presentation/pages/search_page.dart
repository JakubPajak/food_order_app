import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Adding horizontal padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Align children with space between
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined),
                    hintText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context, '/home');
                  },
                  child: Text('Cancel')),
            ],
          ),
        ),
      ),
    );
  }
}
