import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onClear;
  final String hintText;

  
  const CustomSearchBar(
      {super.key, this.controller, this.onClear, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 335.w,
        height: 54.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 16.w),
            SvgPicture.asset(AppImages.searchIcon),
            SizedBox(width: 12.w),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: AppTextStyles.searchHint,
                  contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close,
                  color: AppColors.backArrowColor, size: 20.sp),
              onPressed: onClear,
            ),
          ],
        ),
      ),
    );
  }
}
