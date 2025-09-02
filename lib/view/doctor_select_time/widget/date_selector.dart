import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

import '../controller/doctor_select_time_controller.dart';

class DateSelector extends StatelessWidget {
  final DoctorSelectTimeController controller;
  const DateSelector({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(controller.dates.length, (i) {
          final date = controller.dates[i];
          final isSelected = controller.selectedDateIndex.value == i;
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: () => controller.selectDate(i),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildDateLabelAndSlots(date, isSelected),
                ),
              ),
            ),
          );
        }),
      ),
    ));
  }

  List<Widget> _buildDateLabelAndSlots(date, bool isSelected) {
    return [
      Text(
        date.label,
        style: AppTextStyles.dateLabel.copyWith(
          color: isSelected ? AppColors.whiteColor : AppColors.blackColor,fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 6),
      Text(
        date.slots,
        style: AppTextStyles.slotLabel.copyWith(
          color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
        ),
        textAlign: TextAlign.center,
      ),
    ];
  }
} 