import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/view/doctor_appointment/controller/doctor_appointement_controller.dart';
import 'time_circle.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class AvailableTimeSection extends StatelessWidget {
  final DoctorAppointementController controller;
  const AvailableTimeSection({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 151.w,
          height: 19.h,
          margin:  EdgeInsets.only(left: 20.w,top: 35.h),
          alignment: Alignment.centerLeft,
          child: Text(
            'Available Time',
            style: AppTextStyles.ratingText,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(controller.times.length, (i) =>
              TimeCircle(
                text: controller.times[i].time,
                isSelected: controller.selectedTime.value == i,
                onTap: () => controller.selectTime(i),
              ),
            ),
          )),
        ),
      ],
    );
  }
} 