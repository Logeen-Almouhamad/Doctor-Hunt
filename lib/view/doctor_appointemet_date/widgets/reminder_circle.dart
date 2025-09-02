import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class ReminderCircle extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ReminderCircle({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.08),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppTextStyles.circleTime.copyWith(
            color: isSelected ? Colors.white : AppColors.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
} 