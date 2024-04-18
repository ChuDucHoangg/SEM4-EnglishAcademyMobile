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
              color: appTheme.gray100,
              borderRadius: BorderRadius.circular(12.h),
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
  static BoxDecoration get fillIndigo => BoxDecoration(
    color: appTheme.indigo90001,
    borderRadius: BorderRadius.circular(28.h),
  );
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray5002,
    borderRadius: BorderRadius.circular(24.h),
  );
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    borderRadius: BorderRadius.circular(10.h),
  );
  static BoxDecoration get fillPrimary => BoxDecoration(
    color: theme.colorScheme.primary,
    borderRadius: BorderRadius.circular(10.h),
  );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
    borderRadius: BorderRadius.circular(28.h),
    border: Border.all(
      color: appTheme.blueGray50,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineBlueGrayTL12 => BoxDecoration(
    borderRadius: BorderRadius.circular(12.h),
    border: Border.all(
      color: appTheme.blueGray80001,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineOnErrorContainer => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(0.25),
    borderRadius: BorderRadius.circular(28.h),
    border: Border.all(
      color: theme.colorScheme.onErrorContainer.withOpacity(0.35),
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineOnErrorContainerTL36 => BoxDecoration(
    color: theme.colorScheme.onErrorContainer.withOpacity(0.25),
    borderRadius: BorderRadius.circular(36.h),
    border: Border.all(
      color: theme.colorScheme.onErrorContainer.withOpacity(0.4),
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineBlueGrayTL121 => BoxDecoration(
    borderRadius: BorderRadius.circular(12.h),
    border: Border.all(
      color: appTheme.blueGray50,
      width: 1.h,
    ),
  );
  static BoxDecoration get fillGrayTL8 => BoxDecoration(
    color: appTheme.gray5002,
    borderRadius: BorderRadius.circular(8.h),
  );
  static BoxDecoration get fillGrayTL20 => BoxDecoration(
    color: appTheme.gray5002,
    borderRadius: BorderRadius.circular(20.h),
  );
  static BoxDecoration get fillBlueGray => BoxDecoration(
    color: appTheme.blueGray50,
    borderRadius: BorderRadius.circular(8.h),
  );
  static BoxDecoration get outlineBlueGrayTL24 => BoxDecoration(
    borderRadius: BorderRadius.circular(24.h),
    border: Border.all(
      color: appTheme.blueGray50,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineBlueGrayTL20 => BoxDecoration(
    borderRadius: BorderRadius.circular(20.h),
    border: Border.all(
      color: appTheme.blueGray50,
      width: 1.h,
    ),
  );
  static BoxDecoration get fillIndigoTL10 => BoxDecoration(
    color: appTheme.indigo100,
    borderRadius: BorderRadius.circular(10.h),
  );
  static BoxDecoration get fillBlueAccentTL100 => BoxDecoration(
    color: Colors.blueAccent.withOpacity(0.8),
    borderRadius: BorderRadius.circular(100.h),
  );
}
