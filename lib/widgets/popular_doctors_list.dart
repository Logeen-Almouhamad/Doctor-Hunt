import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/widgets/doctor_rating_stars.dart';

class PopularDoctorsList extends StatelessWidget {
  final List popularDoctors;
  const PopularDoctorsList({super.key, required this.popularDoctors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: popularDoctors.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final doc = popularDoctors[index];
          return InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.doctorDetails);
            },
            child: Container(
              width: 140.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.08),
                    blurRadius: 40.r,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                      bottomLeft: Radius.circular(2.r),
                      bottomRight: Radius.circular(2.r),
                    ),
                    child: Image.asset(
                      doc.image,
                      width: 140.w,
                      height: 131.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Center(
                    child: Column(
                      children: [
                        Text(doc.name, style: AppTextStyles.doctorName2),
                        SizedBox(height: 2.h),
                        Text(doc.specialty, style: AppTextStyles.doctorspecialty),
                        SizedBox(height: 6.h),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 40.w,
                          ),
                          child: Row(
                            children: [
                              DoctorRatingStars(
                                rating: doc.rating,
                                starSize: 14,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
