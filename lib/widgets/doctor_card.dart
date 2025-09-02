import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grad_projectx2/widgets/doctor_rating_stars.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../view/my_doctors/controller/my_doctors_controller.dart';


class DoctorCard extends StatelessWidget {
  final FavoriteController controller = Get.put(FavoriteController());

  final String name;
  final String clinic;
  final String imagePath;
  final double rating;
  final bool isFavorite;
  final VoidCallback onTapFavorite;

   DoctorCard({
    super.key,
    required this.name,
    required this.clinic,
    required this.imagePath,
    required this.rating,
    required this.isFavorite,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: 335.w,
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
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: SizedBox(
                  width: 72.w,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 9.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppTextStyles.doctorName),
                    SizedBox(height: 4.h),
                    Text(clinic, style: AppTextStyles.subdoctorname),
                    SizedBox(height: 5.95.h),
                    Row(
                      children: [
                        DoctorRatingStars(rating: rating),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: onTapFavorite,
              child: Obx(() => Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 20,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
