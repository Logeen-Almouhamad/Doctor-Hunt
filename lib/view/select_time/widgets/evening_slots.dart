import 'package:flutter/material.dart';
import 'package:grad_projectx2/view/select_time/controller/doctor_select_time_controller2.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EveningSlots extends StatelessWidget {
  final DoctorSelectTimeController2 controller;
  const EveningSlots({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Evening 5 slots', style: AppTextStyles.timeTitle),
        SizedBox(height: 15.h),
        Obx(() => Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: List.generate(controller.eveningSlots.length, (i) {
                final slot = controller.eveningSlots[i];
                final isSelected = controller.selectedSlot.value == slot;
                return GestureDetector(
                  onTap: () => controller.selectSlot(slot),
                  child: Container(
                    width: 76,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryColor
                          : AppColors.primaryColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      slot,
                      style: AppTextStyles.slotTime.copyWith(
                        color: isSelected
                            ? AppColors.whiteColor
                            : AppColors.primaryColor,
                      ),
                    ),
                  ),
                );
              }),
            )),
      ],
    );
  }
}
