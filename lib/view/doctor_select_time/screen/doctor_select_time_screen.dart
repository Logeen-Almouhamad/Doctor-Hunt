import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import '../../../widgets/custom_app_bar.dart';

import '../../../widgets/doctor_card.dart' hide DoctorCard;
import '../controller/doctor_select_time_controller.dart';
import '../widget/custom_doctor_card2.dart';
import '../widget/date_selector.dart';


class DoctorSelectTimeScreen extends StatelessWidget {
  final DoctorSelectTimeController controller = Get.put(
    DoctorSelectTimeController(),
  );

  DoctorSelectTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctor = controller.doctor;
    return Scaffold(
      body: CustomBackground(
        child: Column(
          children: [
            CustomAppBar(title: 'Select Time'),
  
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  DoctorCard(imagePath: AppImages.doctorImage,
                    name: 'Dr. Shruti Kedia',
                    clinic: 'Upasana Dental Clinic, salt lake',
                    rating: 4,
                    isFavorite: true,
                    onTapFavorite: () {  },),
                  SizedBox(height: 20.h),
                  DateSelector(controller: controller),
                  SizedBox(height: 16.h),
                  Text(
                    'Today, 23 Feb',
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.blackColor,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'No slots available',
                    style: AppTextStyles.hintTextstyle.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Material(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(6.r),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.selectTime2);
                      },
                      borderRadius: BorderRadius.circular(6.r),
                      child: Container(
                        width: 310.w,
                        height: 56.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Next availability on wed, 24 Feb',
                            style: AppTextStyles.customButtonText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'OR',
                      style: AppTextStyles.hintTextstyle.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(6.r),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(6.r),
                      child: Container(
                        width: 310.w,
                        height: 56.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(
                            color: AppColors.primaryColor.withOpacity(0.50),
                            // green border
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          'Contact Clinic',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor, // green text
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
