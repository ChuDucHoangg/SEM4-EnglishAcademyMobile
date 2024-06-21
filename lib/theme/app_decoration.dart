import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
    color: appTheme.blueGray100,
  );
  static BoxDecoration get fillBlueGrayB => BoxDecoration(
    color: appTheme.blueGray800B2,
  );
  static BoxDecoration get fillBluegray80001 => BoxDecoration(
    color: appTheme.blueGray80001,
  );
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray50,
  );
  static BoxDecoration get fillGray100 => BoxDecoration(
    color: appTheme.gray100,
  );
  static BoxDecoration get fillGray10001 => BoxDecoration(
    color: appTheme.gray10001,
  );
  static BoxDecoration get fillGray5002 => BoxDecoration(
    color: appTheme.gray5002,
  );
  static BoxDecoration get fillGreen => BoxDecoration(
    color: appTheme.green50,
  );
  static BoxDecoration get fillGreenB => BoxDecoration(
    color: appTheme.green900,
  );
  static BoxDecoration get fillIndigo => BoxDecoration(
    color: appTheme.indigo100,
  );
  static BoxDecoration get fillIndigo90001 => BoxDecoration(
    color: appTheme.indigo90001,
  );
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
  );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
    color: theme.colorScheme.onPrimary,
  );
  static BoxDecoration get fillPrimary => BoxDecoration(
    color: theme.colorScheme.primary,
  );
  static BoxDecoration get fillRedA => BoxDecoration(
    color: appTheme.redA200,
  );
  static BoxDecoration get fillYellow => BoxDecoration(
    color: appTheme.yellow50,
  );

  // Gradient decorations
  static BoxDecoration get gradientGrayToGray => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1.08),
      colors: [
        appTheme.gray90002.withOpacity(0),
        appTheme.gray90002,
      ],
    ),
  );

  // Outline decorations
  static BoxDecoration get outlineBlueGray => BoxDecoration(
    color: appTheme.gray5002,
    border: Border.all(
      color: appTheme.blueGray50,
      width: 1.h,
      strokeAlign: strokeAlignCenter,
    ),
  );
  static BoxDecoration get outlineBluegray30002 => BoxDecoration(
    border: Border.all(
      color: appTheme.blueGray30002,
      width: 1.h,
      strokeAlign: strokeAlignCenter,
    ),
  );
  static BoxDecoration get outlineBluegray50 => BoxDecoration(
    border: Border.all(
      color: appTheme.blueGray50,
      width: 1.h,
      strokeAlign: strokeAlignCenter,
    ),
  );
  static BoxDecoration get outlineBluegray501 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    border: Border.all(
      color: appTheme.blueGray50,
      width: 1.h,
      strokeAlign: strokeAlignCenter,
    ),
  );
  static BoxDecoration get outlineBluegray502 => BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: appTheme.blueGray50,
        width: 1.h,
      ),
    ),
  );
  static BoxDecoration get outlineBluegray503 => BoxDecoration(
    border: Border.all(
      color: appTheme.blueGray50,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineBluegray504 => BoxDecoration(
    border: Border(
      top: BorderSide(
        color: appTheme.blueGray50,
        width: 1.h,
      ),
      bottom: BorderSide(
        color: appTheme.blueGray50,
        width: 1.h,
      ),
    ),
  );
  static BoxDecoration get outlineBluegray505 => BoxDecoration(
    border: Border(
      top: BorderSide(
        color: appTheme.blueGray50,
        width: 5.h,
      ),
      left: BorderSide(
        color: appTheme.blueGray50,
        width: 1.h,
      ),
      right: BorderSide(
        color: appTheme.blueGray50,
        width: 1.h,
      ),
      bottom: BorderSide(
        color: appTheme.blueGray50,
        width: 1.h,
      ),
    ),
  );
  static BoxDecoration get outlineBluegray506 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    border: Border.all(
      color: appTheme.blueGray50,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineBluegray507 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    border: Border(
      left: BorderSide(
        color: appTheme.blueGray50,
        width: 1.h,
      ),
      bottom: BorderSide(
        color: appTheme.blueGray50,
        width: 1.h,
      ),
      right: BorderSide(
        color: appTheme.blueGray50,
        width: 1.h,
      ),
    ),
  );
  static BoxDecoration get outlineBluegray70059 => BoxDecoration(
    border: Border.all(
      color: appTheme.blueGray70059,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineBluegray80001 => BoxDecoration(
    color: appTheme.redA200,
    border: Border.all(
      color: appTheme.blueGray80001,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineGray => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.06),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          2,
          4,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray100 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    border: Border.all(
      color: appTheme.gray100,
      width: 1.h,
      strokeAlign: strokeAlignCenter,
    ),
  );
  static BoxDecoration get outlineGray1001 => BoxDecoration(
    border: Border.all(
      color: appTheme.gray100,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineGray900 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.05),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          2,
          4,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray9001 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.06),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          4,
          8,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray90010 => BoxDecoration(
    color: appTheme.indigo100,
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.08),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          2,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray90011 => BoxDecoration(
    color: appTheme.yellow50,
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.08),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          2,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray9002 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.05),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          4,
          8,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray9003 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.04),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          -8,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray9004 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.03),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          -8,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray9005 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.05),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          8,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray9006 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.04),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          -8,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray9007 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.02),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          -8,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray9008 => BoxDecoration(
    color: appTheme.green50,
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.08),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          2,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray9009 => BoxDecoration(
    color: appTheme.gray5001,
    boxShadow: [
      BoxShadow(
        color: appTheme.gray900.withOpacity(0.08),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          2,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineOnErrorContainer => BoxDecoration(
    color: theme.colorScheme.primary,
    border: Border.all(
      color: appTheme.blueGray50,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineOnErrorContainer1 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    border: Border.all(
      color: theme.colorScheme.onErrorContainer.withOpacity(0.4),
      width: 2.h,
      strokeAlign: strokeAlignCenter,
    ),
  );
  static BoxDecoration get outlineOnErrorContainer2 => BoxDecoration(
    color: appTheme.redA200,
    border: Border.all(
      color: theme.colorScheme.onErrorContainer.withOpacity(1),
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineOnErrorContainer3 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(0.2),
    border: Border(
      top: BorderSide(
        color: theme.colorScheme.onErrorContainer,
        width: 1.h,
      ),
    ),
  );
  static BoxDecoration get outlinePink => BoxDecoration(
    color: appTheme.gray5001,
    border: Border.all(
      color: appTheme.pink50,
      width: 1.h,
      strokeAlign: strokeAlignCenter,
    ),
  );
  static BoxDecoration get outlineGreen => BoxDecoration(
    color: appTheme.greenA400.withOpacity(0.2),
    border: Border.all(
      color:  appTheme.greenA400.withOpacity(0.5),
      width: 1.h,
      strokeAlign: strokeAlignCenter,
    ),
  );
  static BoxDecoration get outlinePrimary => BoxDecoration(
    border: Border.all(
      color: appTheme.blueGray300,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlinePrimaryContainer => BoxDecoration(
    color: appTheme.indigo100,
    border: Border.all(
      color: theme.colorScheme.primaryContainer,
      width: 1.h,
      strokeAlign: strokeAlignCenter,
    ),
  );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
    color: appTheme.indigo100,
    border: Border.all(
      color: theme.colorScheme.primary,
      width: 1.h,
    ),
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
    16.h,
  );
  static BorderRadius get circleBorder20 => BorderRadius.circular(
    20.h,
  );
  static BorderRadius get circleBorder24 => BorderRadius.circular(
    24.h,
  );
  static BorderRadius get circleBorder48 => BorderRadius.circular(
    48.h,
  );
  static BorderRadius get circleBorder5 => BorderRadius.circular(
    5.h,
  );

  // Custom borders
  static BorderRadius get customBorderBL12 => BorderRadius.only(
    topRight: Radius.circular(12.h),
    bottomLeft: Radius.circular(12.h),
    bottomRight: Radius.circular(12.h),
  );
  static BorderRadius get customBorderBL16 => BorderRadius.vertical(
    bottom: Radius.circular(16.h),
  );
  static BorderRadius get customBorderTL10 => BorderRadius.only(
    topLeft: Radius.circular(10.h),
    bottomLeft: Radius.circular(10.h),
    bottomRight: Radius.circular(10.h),
  );
  static BorderRadius get customBorderTL100 => BorderRadius.only(
    topLeft: Radius.circular(100.h),
    topRight: Radius.circular(100.h),
    bottomLeft: Radius.circular(6.h),
    bottomRight: Radius.circular(6.h),
  );
  static BorderRadius get customBorderTL24 => BorderRadius.vertical(
    top: Radius.circular(24.h),
  );
  static BorderRadius get customBorderTL32 => BorderRadius.vertical(
    top: Radius.circular(32.h),
  );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
    12.h,
  );
  static BorderRadius get roundedBorder2 => BorderRadius.circular(
    2.h,
  );
  static BorderRadius get roundedBorder63 => BorderRadius.circular(
    63.h,
  );
  static BorderRadius get roundedBorder72 => BorderRadius.circular(
    72.h,
  );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
    8.h,
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
