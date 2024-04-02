import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget({Key? key})
      : super(
    key: key,
  );

  List<String> categories = [
    "Arts & Humanities",
    "Graphic Design",
    "3D Design",
    "Web Development",
    "Seo & Marketing",
    "Finance"
  ];

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 20.h),
    child: CarouselSlider(
      options: CarouselOptions(
        height: 50.v,
        viewportFraction: 0.4,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: categories.map((category) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: Center(
                child: Text(
                  category,
                  style: CustomTextStyles.titleSmallPrimary15,
                ),
              ),
            );
          },
        );
      }).toList(),
    ),
  );
}
  }