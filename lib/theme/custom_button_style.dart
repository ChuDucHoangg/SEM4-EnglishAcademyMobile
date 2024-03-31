import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlue => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blue50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.h),
    ),
  );
  static ButtonStyle get fillBlueTL14 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blue50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.h),
    ),
  );
  static ButtonStyle get fillBlue1 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blue50,
  );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.h),
    ),
  );
  static ButtonStyle get fillTeal => ElevatedButton.styleFrom(
    backgroundColor: appTheme.teal700,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.h),
    ),
  );

  // Outline button style
  static ButtonStyle get outlineBlue => OutlinedButton.styleFrom(
    backgroundColor: appTheme.gray50,
    side: BorderSide(
      color: appTheme.blue50,
      width: 2,
    ),
    shape: RoundedRectangleBorder(),
  );
  static ButtonStyle get outlineBlueGray => OutlinedButton.styleFrom(
    backgroundColor: appTheme.blue50,
    side: BorderSide(
      color: appTheme.blueGray200.withOpacity(0.2),
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.h),
    ),
  );
  static ButtonStyle get outlineBlueGrayTL30 => OutlinedButton.styleFrom(
    backgroundColor: appTheme.blue50,
    side: BorderSide(
      color: appTheme.blueGray200.withOpacity(0.4),
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.h),
    ),
  );
  static ButtonStyle get outlineBlueGrayTL301 => OutlinedButton.styleFrom(
    backgroundColor: appTheme.gray50,
    side: BorderSide(
      color: appTheme.blueGray200.withOpacity(0.3),
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.h),
    ),
  );
  static ButtonStyle get outlineBlueGrayTL8 => OutlinedButton.styleFrom(
    backgroundColor: appTheme.blue50,
    side: BorderSide(
      color: appTheme.blueGray200.withOpacity(0.5),
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
  );
  static ButtonStyle get outlineTeal => OutlinedButton.styleFrom(
    backgroundColor: appTheme.teal700,
    side: BorderSide(
      color: appTheme.teal700,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.h),
    ),
  );
  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
  );
}
