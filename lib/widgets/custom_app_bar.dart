import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBack;
  final Color? titleColor;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.showBack = true,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showBack)
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.whiteColor,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 12.sp,
                    color: AppColors.backArrowColor,
                  ),
                ),
              ),
            SizedBox(
              width: 19.w,
            ),
            Text(
              title,
              style: AppTextStyles.appBarTitle.copyWith(
                color: titleColor ?? AppTextStyles.appBarTitle.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
