import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillAmberA => ElevatedButton.styleFrom(
    backgroundColor: appTheme.amberA200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.h),
    ),
  );
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blueGray50001,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28.h),
    ),
  );
  static ButtonStyle get fillBlueGrayTL10 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blueGray80001,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          10.h,
        ),
        bottomLeft: Radius.circular(
          10.h,
        ),
        bottomRight: Radius.circular(
          10.h,
        ),
      ),
    ),
  );
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
    backgroundColor: appTheme.gray5002,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
  );
  static ButtonStyle get fillGrayTL100 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.gray100,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          100.h,
        ),
        topRight: Radius.circular(
          100.h,
        ),
        bottomLeft: Radius.circular(
          6.h,
        ),
        bottomRight: Radius.circular(
          6.h,
        ),
      ),
    ),
  );
  static ButtonStyle get fillIndigo => ElevatedButton.styleFrom(
    backgroundColor: appTheme.indigo100,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28.h),
    ),
  );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28.h),
    ),
  );
  static ButtonStyle get fillPrimaryTL24 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.h),
    ),
  );
  static ButtonStyle get fillPrimaryTL8 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
  );

  // Outline button style
  static ButtonStyle get outlineBlueGray => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: appTheme.blueGray50,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
  );
  static ButtonStyle get outlineBlueGrayTL24 => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: appTheme.blueGray80001,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.h),
    ),
  );
  static ButtonStyle get outlineBlueGrayTL28 => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: appTheme.blueGray50001,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28.h),
    ),
  );
  static ButtonStyle get outlineBlueGrayTL81 => OutlinedButton.styleFrom(
    backgroundColor: appTheme.indigo100,
    side: BorderSide(
      color: appTheme.blueGray600,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
  );
  static ButtonStyle get outlineGray => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: appTheme.gray20002,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
  );
  static ButtonStyle get outlineGrayTL4 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.yellow50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.h),
    ),
    shadowColor: appTheme.gray900.withOpacity(0.08),
    elevation: 2,
  );
  static ButtonStyle get outlineGrayTL41 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.indigo100,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.h),
    ),
    shadowColor: appTheme.gray900.withOpacity(0.08),
    elevation: 2,
  );
  static ButtonStyle get outlineGrayTL5 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.gray5001,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
    shadowColor: appTheme.gray900.withOpacity(0.08),
    elevation: 2,
  );
  static ButtonStyle get outlineGrayTL52 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blue50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
    shadowColor: appTheme.gray900.withOpacity(0.08),
    elevation: 2,
  );
  static ButtonStyle get outlineGrayTL53 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blueGray50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
    shadowColor: appTheme.gray900.withOpacity(0.08),
    elevation: 2,
  );
  static ButtonStyle get outlineOnErrorContainer => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: theme.colorScheme.onErrorContainer.withOpacity(1),
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28.h),
    ),
  );
  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
  );
}
