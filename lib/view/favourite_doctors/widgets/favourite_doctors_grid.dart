import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/favourite_doctors/controller/favourite_doctor_controller.dart';

class FavouriteDoctorsGrid extends StatelessWidget {
  final FavouriteDoctorsController controller;
  const FavouriteDoctorsGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 15.w,
          ),
          itemCount: controller.favouriteDoctors.length,
          itemBuilder: (context, index) {
            final doc = controller.favouriteDoctors[index];
            return InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.doctorDetailsScreen);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.06),
                      blurRadius: 20,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 26.w, ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 36.r,
                            backgroundImage: AssetImage(
                              doc.image.isNotEmpty ? doc.image : 'assets/images/img7.png',
                            ),

                          ),
                          SizedBox(height: 11.h),
                          Text(
                            doc.name,
                            style: AppTextStyles.docName,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.h),
                          if (doc.specialty.isNotEmpty)
                            Text(
                              doc.specialty,
                              style: AppTextStyles.viewsText.copyWith(color: AppColors.primaryColor),
                              textAlign: TextAlign.center,
                            ),

                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () => controller.deleteDoctorFromFavourites(index),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.favoriteIconColor,
                          size: 16.sp,
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            );
          },

    ));
  }
}
