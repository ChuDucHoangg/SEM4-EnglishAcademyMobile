import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomFloatingButton extends StatelessWidget {
  CustomFloatingButton({
    Key? key,
    this.alignment,
    this.backgroundColor,
    this.onTap,
    this.width,
    this.height,
    this.decoration,
    this.child,
  }) : super(
    key: key,
  );

  final Alignment? alignment;

  final Color? backgroundColor;

  final VoidCallback? onTap;

  final double? width;

  final double? height;

  final BoxDecoration? decoration;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: fabWidget,
    )
        : fabWidget;
  }

  Widget get fabWidget => FloatingActionButton(
    backgroundColor: backgroundColor,
    onPressed: onTap,
    child: Container(
      alignment: Alignment.center,
      width: width ?? 0,
      height: height ?? 0,
      decoration: decoration ??
          BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(28.h),
          ),
      child: child,
    ),
  );
}

/// Extension on [CustomFloatingButton] to facilitate inclusion of all types of border style etc
extension FloatingButtonStyleHelper on CustomFloatingButton {
  static BoxDecoration get fillBlueGray => BoxDecoration(
    color: appTheme.blueGray600,
    borderRadius: BorderRadius.circular(28.h),
  );
  static BoxDecoration get fillPrimaryTL12 => BoxDecoration(
    color: theme.colorScheme.primary,
    borderRadius: BorderRadius.circular(12.h),
  );
}
