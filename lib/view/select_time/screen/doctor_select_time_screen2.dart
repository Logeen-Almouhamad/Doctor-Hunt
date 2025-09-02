import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/view/select_time/controller/doctor_select_time_controller2.dart';
import 'package:grad_projectx2/view/select_time/widgets/afternoon_slots.dart';
import 'package:grad_projectx2/view/select_time/widgets/date_selector.dart';
import 'package:grad_projectx2/view/select_time/widgets/evening_slots.dart';
import 'package:grad_projectx2/view/select_time/widgets/today_label.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/doctor_card.dart';

class DoctorSelectTimeScreen2 extends StatelessWidget {
  const DoctorSelectTimeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorSelectTimeController2());
    return CustomBackground(
      child: Column(
        children: [
          const CustomAppBar(title: 'Select Time'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Card
                  DoctorCard(
                    imagePath: AppImages.doctorImage,
                    name: 'Dr. Shruti Kedia',
                    clinic: 'Upasana Dental Clinic, salt lake',
                    rating: 4,
                    isFavorite: true,
                    onTapFavorite: () {},
                  ),
                  SizedBox(height: 24.h),
                  DateSelector(controller: controller),
                  SizedBox(height: 19.h),
                  TodayLabel(controller: controller),
                  SizedBox(height: 35.h),
                  AfternoonSlots(controller: controller),
                  SizedBox(height: 21.h),
                  EveningSlots(controller: controller),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
