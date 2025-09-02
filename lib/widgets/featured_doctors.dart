import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';

class FeaturedDoctorCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String salary;
  final double rating;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const FeaturedDoctorCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.salary,
    required this.rating,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      padding: EdgeInsets.only(left: 8.w,right: 8.w, bottom: 12.h,top: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20.r,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Top Row (Favorite + Rating)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onFavoriteTap,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : const Color(0xff777EA5),
                  size: 12.sp,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 9.sp),
                  SizedBox(width: 3.w),
                  Text(
                    rating.toStringAsFixed(1),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Avatar
          SizedBox(height: 8.h),
          CircleAvatar(
            radius: 27.w,
            backgroundImage: AssetImage(imageUrl),
          ),

          /// Name
          SizedBox(height: 10.h),
          Text(
            name,
            style: AppTextStyles.doctorName.copyWith(
              fontSize: 12.sp,
              color: AppColors.titleColor,
            ),
            textAlign: TextAlign.center,
          ),

          /// Salary
          SizedBox(height: 3.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '\$ ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 9.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: salary,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 9.sp,
                    color: AppColors.backArrowColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedDoctorsList extends StatelessWidget {
  final List<dynamic> doctors;
  final void Function(int index)? onFavoriteTap;

  const FeaturedDoctorsList({
    super.key,
    required this.doctors,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: doctors.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final doc = doctors[index];
          return Obx(
            () => FeaturedDoctorCard(
              imageUrl: doc.image,
              name: doc.name,
              salary: doc.salary,
              rating: doc.rating ?? 0.0,
              isFavorite: doc.isFavorite.value,
              onFavoriteTap: () => onFavoriteTap?.call(index),
            ),
          );
        },
      ),
    );
  }
}
