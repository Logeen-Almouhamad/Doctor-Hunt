import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

import '../../../widgets/doctor_rating_stars.dart';


class DoctorCard extends StatelessWidget {
  final String name;
  final String clinic;
  final String imagePath;
  final double rating;
  final bool isFavorite;
  final VoidCallback onTapFavorite;

  const DoctorCard({
    Key? key,
    required this.name,
    required this.clinic,
    required this.imagePath,
    required this.rating,
    required this.isFavorite,
    required this.onTapFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.w),
      width: 335.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  width: 72.w,
                  height: 68.h,
                  child: Image.asset(
                    imagePath,
                    width: 72.w,
                    height: 62.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: AppTextStyles.doctorName),
                      SizedBox(height: 4.h),
                      Text(clinic, style: AppTextStyles.subdoctorname),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          DoctorRatingStars(rating: rating),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: onTapFavorite,
              child: Icon(
                Icons.favorite,
                weight: 10.w,
                color: isFavorite ? AppColors.favoriteIconColor : AppColors.empty,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
