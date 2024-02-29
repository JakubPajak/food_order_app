import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

class MainSliderWidget extends StatelessWidget {
  final List<SliderItem> items;

  MainSliderWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                clipBehavior: Clip.antiAlias,
                height: 150,
                width: 150,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        items[index].imgPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                    Center(
                      child: Text(
                        items[index].title,
                        style: PoppinsStyles().lightBold(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SliderItem {
  final String imgPath;
  final String title;

  SliderItem({required this.imgPath, required this.title});
}
