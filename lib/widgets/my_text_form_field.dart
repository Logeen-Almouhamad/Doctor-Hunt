import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';


class MyTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? focusedBorderWidth;
  final Color? iconColor;
  final bool obscureText;
  final String? Function(String?)? validator;

  const MyTextFormField({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText = '',
    this.labelStyle = const TextStyle(
      color: Color(0xff677294),
      fontWeight: FontWeight.w300,
      fontSize: 16,

    ),

    this.suffixIcon,
    this.borderColor = const Color(0xff677294),
    this.borderRadius = 12,
    this.borderWidth = 1.0,
    this.focusedBorderWidth = 2.5,
    this.iconColor = const Color(0xff677294),
    this.obscureText = false,
    this.validator, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.backArrowColor,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(color: borderColor!, width: borderWidth!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(color: borderColor!, width: focusedBorderWidth!),
        ),
        labelText: labelText,
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        filled: false,
        fillColor: Colors.transparent,
      ),

    );
  }
}
