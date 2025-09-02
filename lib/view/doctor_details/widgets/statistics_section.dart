import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/view/doctor_details/controller/doctor_details_controller.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class StatisticsSection extends StatelessWidget {
  final DoctorDetailsController controller;
  const StatisticsSection({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 305.w,
        height: 84.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.08),
              offset: const Offset(0, 0),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: 90.w,
                height: 64.h,
                decoration: BoxDecoration(
                  color: AppColors.backContainerColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(
                          controller.runningCount.value.toString(),
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.titleColor,
                          ),
                        )),
                    SizedBox(height: 4.h),
                    Text(
                      'Runing',
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Container(
                width: 90.w,
                height: 64.h,
                decoration: BoxDecoration(
                  color: AppColors.backContainerColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(
                          controller.ongoingCount.value.toString(),
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.titleColor,
                          ),
                        )),
                    SizedBox(height: 4.h),
                    Text(
                      'Ongoing',
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Container(
                width: 90.w,
                height: 64.h,
                decoration: BoxDecoration(
                  color: AppColors.backContainerColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        controller.patientCount.value.toString(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.titleColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Patient',
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
