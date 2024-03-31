import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
    key: key,
  );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: iconButtonWidget,
    )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
    height: height ?? 0,
    width: width ?? 0,
    child: IconButton(
      padding: EdgeInsets.zero,
      icon: Container(
        height: height ?? 0,
        width: width ?? 0,
        padding: padding ?? EdgeInsets.zero,
        decoration: decoration ??
            BoxDecoration(
              color: appTheme.teal700,
              borderRadius: BorderRadius.circular(8.h),
            ),
        child: child,
      ),
      onPressed: onTap,
    ),
  );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineBlack => BoxDecoration(
    color: theme.colorScheme.primary,
    borderRadius: BorderRadius.circular(30.h),
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
  static BoxDecoration get outlineBlackTL24 => BoxDecoration(
    color: appTheme.whiteA700,
    borderRadius: BorderRadius.circular(24.h),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.1),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          1,
          2,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineTeal => BoxDecoration(
    color: appTheme.blue50,
    borderRadius: BorderRadius.circular(18.h),
    border: Border.all(
      color: appTheme.teal700,
      width: 2.h,
    ),
  );
  static BoxDecoration get outlineTealTL20 => BoxDecoration(
    borderRadius: BorderRadius.circular(20.h),
    border: Border.all(
      color: appTheme.teal700,
      width: 2.h,
    ),
  );
  static BoxDecoration get outlineBlackTL31 => BoxDecoration(
    color: appTheme.teal700,
    borderRadius: BorderRadius.circular(31.h),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.2),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          1,
          4,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlackTL26 => BoxDecoration(
    color: appTheme.gray50,
    borderRadius: BorderRadius.circular(26.h),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.1),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          1,
          3,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlackTL261 => BoxDecoration(
    color: theme.colorScheme.primary,
    borderRadius: BorderRadius.circular(26.h),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.1),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          1,
          3,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlackTL311 => BoxDecoration(
    color: appTheme.redA400,
    borderRadius: BorderRadius.circular(31.h),
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
  static BoxDecoration get outlineBlueGray => BoxDecoration(
    color: appTheme.blue50,
    borderRadius: BorderRadius.circular(12.h),
    border: Border.all(
      color: appTheme.blueGray200.withOpacity(0.5),
      width: 2.h,
    ),
  );
  static BoxDecoration get outlineTealTL8 => BoxDecoration(
    color: appTheme.whiteA700,
    borderRadius: BorderRadius.circular(8.h),
    border: Border.all(
      color: appTheme.teal700,
      width: 3.h,
    ),
  );
}
