import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final Icon suffixIcon;
  final TextEditingController? controller; // Make it nullable
  final ValueChanged<String>? onChanged; // Make it nullable

  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.whiteColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.whiteColor),
        ),
        hintStyle: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500, fontSize: 18.sp),
      ),
    );
  }
}
