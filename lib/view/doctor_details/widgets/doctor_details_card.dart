import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/doctor_details/controller/doctor_details_controller.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../widgets/doctor_rating_stars.dart';

class DoctorDetailsCard extends StatelessWidget {
  final DoctorDetailsController controller;
  DoctorDetailsCard({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 170.h,
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.08),
            blurRadius: 20.r,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: Image.asset(
                  controller.doctorImage.value,
                  width: 92.w,
                  height: 87.h,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.doctorName.value,
                                style: AppTextStyles.customButtonText
                                    .copyWith(color: AppColors.titleColor),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                controller.doctorSpecialty.value,
                                style: AppTextStyles.doctorspecialty
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.toggleFavorite,
                          child: Transform.translate(
                            offset: Offset(-2, -13.h),
                            child: SizedBox(
                              width: 19.w,
                              height: 17.h,
                              child: Icon(
                                controller.isFavorite.value
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: controller.isFavorite.value
                                    ? Colors.red
                                    : Colors.grey,
                                size: 23,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Transform.scale(
                            scale: 1.6,
                            child: const DoctorRatingStars(rating: 6),
                          ),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: '\$ ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:16.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: '28.00/hr',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16.sp,
                              color: AppColors.backArrowColor,
                            ),
                          ),
                        ])),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.only(left: 75),
            child: SizedBox(
              width: 140.w,
              height: 32.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                ),
                onPressed: () {
                  controller.bookAppointment;
                  Get.toNamed(AppRoutes.appointment);
                },
                child: Text(
                  'Book Now',
                  style: AppTextStyles.doctorName2.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
