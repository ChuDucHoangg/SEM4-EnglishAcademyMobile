import 'package:flutter/material.dart';

import '../../../../theme/app_decoration.dart';

class DateButton extends StatelessWidget {
  final String day;
  final TabController tabController;
  final int index;

  const DateButton({
    Key? key,
    required this.day,
    required this.tabController,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = tabController.index == index;
    return GestureDetector(
      onTap: () {
        tabController.animateTo(index);
      },
      child: Container(
        decoration: isSelected
            ? AppDecoration.outlineOnErrorContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        )
            : AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          day,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
