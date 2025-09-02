import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/view/doctor_appointment/controller/doctor_appointement_controller.dart';
import '../../../../../../widgets/doctor_rating_stars.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class DoctorAppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorAppointementController>();
    return Obx(() => Container(
          width: 335.w,
          height: 123.h,
          padding: EdgeInsets.only(left: 10.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.08),
                blurRadius: 20,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    controller.doctorImage.value,
                    width: 92.w,
                    height: 87.h,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.h, left: 13.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.doctorName.value,
                          style: AppTextStyles.doctorName
                              .copyWith(fontSize: 18.sp)),
                      Text(controller.doctorSpecialty.value,
                          style: AppTextStyles.subdoctorname
                              .copyWith(fontSize: 14.sp)),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          DoctorRatingStars(
                              rating: controller.doctorRating.value,
                              starSize: 12),
                          Spacer(),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: '\$ ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
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
              ),
              GestureDetector(
                onTap: controller.toggleFavorite,
                child: Transform.translate(
                  offset: Offset(-10, -28.h),
                  child: Icon(
                    controller.isFavorite.value
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: controller.isFavorite.value
                        ? Colors.red
                        : Colors.grey.shade300,
                    size: 22.sp,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
