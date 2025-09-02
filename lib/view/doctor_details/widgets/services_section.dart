import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/view/doctor_details/controller/doctor_details_controller.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class ServicesSection extends StatelessWidget {
  final DoctorDetailsController controller;
  const ServicesSection({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services',
          style: AppTextStyles.title.copyWith(
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 17.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1.',
              style: AppTextStyles.number,
            ),
            SizedBox(width: 10.w),
            Text(
              'Patient care should be the number one priority.',
              style: AppTextStyles.number.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.backArrowColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Divider(
          endIndent: 2,
          thickness: 0.8,
          color: AppColors.backArrowColor.withOpacity(0.10),
        ),
        SizedBox(height: 17.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2.',
              style: AppTextStyles.number,
            ),
            SizedBox(width: 10.w),
            Text(
              'If you run your practiceyou know how frustrating.',
              style: AppTextStyles.number.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.backArrowColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Divider(
          endIndent: 2,
          thickness: 0.8,
          color: AppColors.backArrowColor.withOpacity(0.10),
        ),
        SizedBox(height: 17.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3.',
              style: AppTextStyles.number,
            ),
            SizedBox(width: 10.w),
            Text(
              'That’s why some of appointment reminder system.',
              style: AppTextStyles.number.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.backArrowColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
