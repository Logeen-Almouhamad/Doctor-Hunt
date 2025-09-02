import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_text.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/find_doctors/controller/find_doctors_controller.dart';



class DoctorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String specialty;
  final String experience;
  final String rating;
  final String reviews;
  final String nextTimeAvailable;
  final String nextDateAvailable;
  final VoidCallback onBook;

  const DoctorCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.rating,
    required this.reviews,
    required this.nextTimeAvailable,
    required this.nextDateAvailable,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    final FindDoctorsController controller = Get.find<FindDoctorsController>();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        // boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.08),
            offset: Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  imagePath,
                  width: 92.w,
                  height: 87.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(name, style: AppTextStyles.appBarTitle),
                        ),
                        Obx(
                              () => GestureDetector(
                            onTap: controller.toggleFavorite,
                            child: Icon(
                              controller.isFavorite.value
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: controller.isFavorite.value ? Colors.red : Colors.grey,
                              size: 20.r, // أو الحجم المناسب لتصميمك
                            ),
                          ),
                        ),

                      ],
                    ),
                    // SizedBox(height:1.h),
                    Text(specialty, style: AppTextStyles.textStyleGreen13w400),
                    Text('$experience Years experience', style: AppTextStyles.textStyleGrey12w300),
                    SizedBox(height: 4.h),
                    Row(
                      children: [

                        CircleAvatar(radius: 4.r, backgroundColor: AppColors.primaryColor),
                        SizedBox(width: 4.w),
                        Text('$rating%', style: AppTextStyles.textStyleGrey11w300),
                        SizedBox(width: 10.w),
                        CircleAvatar(radius: 4.r, backgroundColor: AppColors.primaryColor),
                        SizedBox(width: 4.w),
                        Text('$reviews Patient Stories', style: AppTextStyles.textStyleGrey11w300),
                      ],
                    ),
                  ],
                ),

              ),
    // Obx(
    //       () => IconButton(
    //     icon: Icon(
    //
    //       controller.isFavorite.value ? Icons.favorite : Icons.favorite_border_outlined,
    //       color: controller.isFavorite.value ? Colors.red : Colors.grey, // لون الأيقونة (حدود أو ممتلئ)
    //     ),
    //     onPressed: controller.toggleFavorite,
    //   ),
    // ),

            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppText.nextAvailable, style: AppTextStyles.textStyleGreen15w500),
                  Row(
                    children: [
                      Text(nextTimeAvailable, style: AppTextStyles.textStyleGrey12w500),
                      SizedBox(width: 4.w),
                      Text(nextDateAvailable, style: AppTextStyles.textStyleGrey12w300),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onBook,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(112.w, 34.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(AppText.bookNowButton, style: AppTextStyles.textStyleWhite12w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
