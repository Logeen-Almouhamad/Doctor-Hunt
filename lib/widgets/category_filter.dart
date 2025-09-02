import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/view/doctors_screen/controller/doctors_controller.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorsController());
    final List<String> categories = [
      "All",
      "Dentist",
      "Cardiology",
      "physio Therapy"
    ];
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: categories.map((category) {
            final isSelected = controller.selectedCategory.value == category;
            return GestureDetector(
              onTap: () => controller.selectCategory(category),
              child: Chip(
                label: Text(category),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                backgroundColor: isSelected
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withOpacity(0.08),
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
                  color: isSelected
                      ? AppColors.whiteColor
                      : AppColors.primaryColor,
                ),
                side: BorderSide.none,
              ),
            );
          }).toList(),
        ));
  }
}
