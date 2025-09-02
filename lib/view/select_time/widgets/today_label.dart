import 'package:flutter/material.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/view/select_time/controller/doctor_select_time_controller2.dart';

class TodayLabel extends StatelessWidget {
  final DoctorSelectTimeController2 controller;
  const TodayLabel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
      child: Text(
        controller.dates[controller.selectedDateIndex.value].label,
        style: AppTextStyles.headlineTitle,
      ),
    ));
  }
} 