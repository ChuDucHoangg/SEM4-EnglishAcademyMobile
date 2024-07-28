import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  BottomBarEnum selectedMenu = BottomBarEnum.Home;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHomeActive,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      activeIcon: ImageConstant.imgUserActive,
      title: "Course",
      type: BottomBarEnum.Course,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgTelevision,
      activeIcon: ImageConstant.imgTelevision,
      title: "Tutor",
      type: BottomBarEnum.Tutor,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfileActive,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // height: 60,
      color: Colors.grey[200],
      shape: CircularNotchedRectangle(),
      child: SizedBox(
        height: 24.v,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomMenuList.length,
            (index) {
              final BottomMenuModel menuItem = bottomMenuList[index];
              final bool isSelected = selectedMenu == menuItem.type;
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedMenu = menuItem.type;
                  });
                  widget.onChanged?.call(menuItem.type);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 350),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? theme.colorScheme.primary : null,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: isSelected ? 1.0 : 0.6,
                        child: CustomImageView(
                          width: 23,
                          height: 23,
                          imagePath:
                              isSelected ? menuItem.activeIcon : menuItem.icon,
                          color: isSelected ? Colors.white : Colors.grey,
                        ),
                      ),
                      if (isSelected)
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            menuItem.title ?? "",
                            style: CustomTextStyles.bodySmallBluegray300_1
                                .copyWith(
                              color: Color(0xFFD5E1F5),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Course,
  Tutor,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}
