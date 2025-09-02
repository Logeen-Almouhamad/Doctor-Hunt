import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';

class DoctorRatingStars extends StatelessWidget {
  final double rating;
  final double? starSize;
  const DoctorRatingStars({super.key, required this.rating, this.starSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 4; i++)
          Icon(Icons.star, color: AppColors.rating, size: starSize ?? 10.sp, weight: 6.3.w),
        Icon(Icons.star, color: AppColors.empty, size: starSize ?? 10.sp, weight: 6.3.w),
      ],
    );
  }
}