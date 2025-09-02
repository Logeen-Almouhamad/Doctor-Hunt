import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

void showLogoutDialog() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 335.w,
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Log Out',
              style: AppTextStyles.logOutTitle,
            ),
            SizedBox(height: 10.h),
            Text(
              'Are you sure you want to logout?',
              style: AppTextStyles.ageHintTextStyle,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'Cancel',
                    style: AppTextStyles.cardDiscountedPrice.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Ok',
                    style: AppTextStyles.cardDiscountedPrice.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    barrierColor: AppColors.blackColor.withOpacity(0.76),
    barrierDismissible: true,
  );
}
