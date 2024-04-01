import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../core/app_export.dart';

class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
    this.pinThemeColor,
  }) : super(key: key);

  final Alignment? alignment;
  final BuildContext context;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Function(String) onChanged;
  final FormFieldValidator<String>? validator;
  final Color? pinThemeColor;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: pinCodeTextFieldWidget,
    )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
    appContext: context,
    controller: controller,
    length: 4,
    keyboardType: TextInputType.number,
    textStyle: textStyle,
    hintStyle: hintStyle,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
    ],
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(10),
      inactiveColor: Colors.transparent,
      activeColor: pinThemeColor ?? Colors.grey,
      selectedColor: Colors.transparent,
    ),
    onChanged: (value) => onChanged(value),
    validator: validator,
  );
}
