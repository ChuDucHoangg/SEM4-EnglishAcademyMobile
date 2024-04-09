import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgNavHome,
        activeIcon: ImageConstant.imgNavHome,
        title: "Home",
        type: BottomBarEnum.Home,
        isSelected: true),
    BottomMenuModel(
      icon: ImageConstant.imgNavExplore,
      activeIcon: ImageConstant.imgNavExplore,
      title: "Instructor",
      type: BottomBarEnum.Instructor,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavExplore,
      activeIcon: ImageConstant.imgNavExplore,
      title: "Course",
      type: BottomBarEnum.Course,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavWishlist,
      activeIcon: ImageConstant.imgNavWishlist,
      title: "Notification",
      type: BottomBarEnum.Notification,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: SizedBox(
        height: 24.v,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomMenuList.length,
                (index) {
              return InkWell(
                onTap: () {
                  for (var element in bottomMenuList) {
                    element.isSelected = false;
                  }
                  bottomMenuList[index].isSelected = true;
                  widget.onChanged?.call(bottomMenuList[index].type);
                  setState(() {});
                },
                child: bottomMenuList[index].isSelected
                    ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      color: appTheme.gray900,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6.v),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style:
                        CustomTextStyles.labelLargeGray900_1.copyWith(
                          color: appTheme.gray900,
                        ),
                      ),
                    ),
                  ],
                )
                    : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].icon,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      color: appTheme.gray60001,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.v),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: CustomTextStyles.bodySmallBluegray300_1
                            .copyWith(
                          color: appTheme.blueGray300,
                        ),
                      ),
                    ),
                  ],
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
  Instructor,
  Course,
  Notification,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isSelected;
}

