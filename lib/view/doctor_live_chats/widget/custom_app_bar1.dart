import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';


class CustomAppBar1 extends StatelessWidget {
  final bool showBack;

  const CustomAppBar1({super.key, this.showBack = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 12.sp,
                    color: AppColors.backArrowColor,
                  ),
                ),
              )
            else
              SizedBox(width: 30.w, height: 30.h), // keeps spacing consistent

            // Small circle avatar at the end
            CircleAvatar(
              radius: 16.r, // adjust size as needed
              backgroundImage: AssetImage(AppImages.doctor), // Replace with your image path
            ),
          ],
        ),
      ),
    );
  }
}
