import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/my_doctors/controller/my_doctors_controller.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text.dart';
import '../core/constants/app_text_styles.dart';
import '../view/find_doctors/my_doctors/my_doctors_controller/my_doctors_controller.dart';

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
    final MyDoctorsController controller = Get.find<MyDoctorsController>();

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.doctorDetails);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal:20.w,vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowDoctorsCardColor,
              offset: const Offset(0, 0),
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
                                size: 20.r,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height:1.h),
                      Text(specialty, style: AppTextStyles.textStyleGreen13w400),
                      Text('$experience Years experience',
                          style: AppTextStyles.textStyleGrey12w300),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
      
                          CircleAvatar(radius: 4.r, backgroundColor: AppColors.primaryColor),
                          SizedBox(width: 4.w),
                          Text('$rating%', style: AppTextStyles.textStyleGrey11w300),
                          SizedBox(width: 10.w),
                          CircleAvatar(radius: 4.r, backgroundColor: AppColors.primaryColor),
                          SizedBox(width: 4.w),
                          Text('$reviews ${AppText.patientStoriesText}',
                              style: AppTextStyles.textStyleGrey11w300),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppText.nextAvailable,
                        style: AppTextStyles.textStyleGreen15w500),
                    Row(
                      children: [
                        Text(nextTimeAvailable,
                            style: AppTextStyles.textStyleGrey12w500),
                        SizedBox(width: 4.w),
                        Text(nextDateAvailable,
                            style: AppTextStyles.textStyleGrey12w300),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onBook,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size(112.w, 34.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  child: Text(AppText.bookNowButton,
                      style: AppTextStyles.textStyleWhite12w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
