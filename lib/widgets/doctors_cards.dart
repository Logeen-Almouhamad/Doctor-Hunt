import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../model/favourite_doctor_model.dart';
import '../view/my_doctors/controller/my_doctors_controller.dart';
import 'favourite_icon.dart';


class DoctorsCards extends StatelessWidget {
  final FavouriteDoctorModel doctor;
  final int index;
  final bool isFromFavoritesScreen;

  const DoctorsCards({
    super.key,
    required this.doctor,
    required this.index,
    this.isFromFavoritesScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            doctor.image,
            width: 82.w,
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name, style: AppTextStyles.doctorName),
                Text(doctor.specialty, style: AppTextStyles.cashBackText),
                SizedBox(height: 11.h),
                Row(
                  children: List.generate(5 * 2 - 1, (index) {
                    if (index.isEven) {
                      int starIndex = index ~/ 2;
                      return Icon(
                        Icons.star,
                        size: 12.sp,
                        color: starIndex < (doctor.rating?.round() ?? 0)
                            ? AppColors.ratingStarColor
                            : AppColors.notRatedStarColor,

                      );
                    } else {
                      return const SizedBox(width: 5);
                    }
                  }),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FavoriteIcon(
                doctor: doctor,
                index: index,
                isFromFavoritesScreen: isFromFavoritesScreen,
              ),
              SizedBox(height: 35.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${doctor.rating ?? 0.0} ",
                      style: AppTextStyles.ratingText,
                    ),
                    TextSpan(
                      text: "(100 views)", // You can update views logic
                      style: AppTextStyles.viewsText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
