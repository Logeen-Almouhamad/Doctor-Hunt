import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/view/doctor_appointment/controller/doctor_appointement_controller.dart';
import 'reminder_circle.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class ReminderSection extends StatelessWidget {
  final DoctorAppointementController controller;
  const ReminderSection({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // width: 151.w,
          height: 19.h,
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Reminder Me Before',
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
            children: List.generate(controller.reminders.length, (i) =>
              ReminderCircle(
                text: controller.reminders[i].label,
                isSelected: controller.selectedReminder.value == i,
                onTap: () => controller.selectReminder(i),
              ),
            ),
          )),
        ),
      ],
    );
  }
} 