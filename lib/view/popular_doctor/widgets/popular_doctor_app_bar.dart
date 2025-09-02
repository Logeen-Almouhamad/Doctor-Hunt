import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';

class PopularDoctorAppBar extends StatelessWidget {
  const PopularDoctorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w,left: 20.w, bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
          IconButton(
            icon: SvgPicture.asset(
              AppImages.searchIcon,
              width: 18.w,
              height: 18.h,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
