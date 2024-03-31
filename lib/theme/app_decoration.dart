import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
    color: appTheme.black900,
  );
  static BoxDecoration get fillBlue => BoxDecoration(
    color: appTheme.blue50,
  );
  static BoxDecoration get fillBlueGray => BoxDecoration(
    color: appTheme.blueGray900.withOpacity(0.8),
  );
  static BoxDecoration get fillBluegray900 => BoxDecoration(
    color: appTheme.blueGray900.withOpacity(0.88),
  );
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray50,
  );
  static BoxDecoration get fillGray900 => BoxDecoration(
    color: appTheme.gray900,
  );
  static BoxDecoration get fillGreen => BoxDecoration(
    color: appTheme.green600,
  );
  static BoxDecoration get fillPrimary => BoxDecoration(
    color: theme.colorScheme.primary,
  );
  static BoxDecoration get fillTeal => BoxDecoration(
    color: appTheme.teal700,
  );
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA700,
  );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
    color: theme.colorScheme.primary,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.3),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          1,
          2,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.1),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          2,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlack9001 => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.08),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlack9002 => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.08),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          2,
          5,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlack9003 => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.16),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          -4,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlue => BoxDecoration(
    color: appTheme.gray50,
    border: Border.all(
      color: appTheme.blue50,
      width: 2.h,
    ),
  );
  static BoxDecoration get outlineBlue50 => BoxDecoration(
    color: appTheme.gray50.withOpacity(0.3),
    border: Border.all(
      color: appTheme.blue50,
      width: 2.h,
      strokeAlign: strokeAlignOutside,
    ),
  );
  static BoxDecoration get outlineBlue501 => BoxDecoration(
    color: theme.colorScheme.primary,
    border: Border.all(
      color: appTheme.blue50,
      width: 2.h,
      strokeAlign: strokeAlignOutside,
    ),
  );
  static BoxDecoration get outlineBlue502 => BoxDecoration(
    border: Border.all(
      color: appTheme.blue50,
      width: 2.h,
      strokeAlign: strokeAlignOutside,
    ),
  );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
    color: appTheme.blue50,
    border: Border.all(
      color: appTheme.blueGray200.withOpacity(0.2),
      width: 2.h,
    ),
  );
  static BoxDecoration get outlineBluegray200 => BoxDecoration(
    color: appTheme.blue50,
    border: Border.all(
      color: appTheme.blueGray200.withOpacity(0.4),
      width: 2.h,
    ),
  );
  static BoxDecoration get outlineTeal => BoxDecoration(
    border: Border.all(
      color: appTheme.teal700,
      width: 2.h,
    ),
  );
  static BoxDecoration get outlineTeal700 => BoxDecoration(
    color: appTheme.teal700,
    border: Border.all(
      color: appTheme.teal700,
      width: 1.h,
      strokeAlign: strokeAlignOutside,
    ),
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder15 => BorderRadius.circular(
    15.h,
  );
  static BorderRadius get circleBorder27 => BorderRadius.circular(
    27.h,
  );
  static BorderRadius get circleBorder30 => BorderRadius.circular(
    30.h,
  );

  // Custom borders
  static BorderRadius get customBorderLR14 => BorderRadius.horizontal(
    right: Radius.circular(14.h),
  );
  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
    top: Radius.circular(30.h),
  );

  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
    1.h,
  );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
    12.h,
  );
  static BorderRadius get roundedBorder18 => BorderRadius.circular(
    18.h,
  );
  static BorderRadius get roundedBorder22 => BorderRadius.circular(
    22.h,
  );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
    4.h,
  );
  static BorderRadius get roundedBorder40 => BorderRadius.circular(
    40.h,
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
