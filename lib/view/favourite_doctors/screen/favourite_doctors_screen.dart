import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/favourite_doctors/controller/favourite_doctor_controller.dart';
import 'package:grad_projectx2/view/favourite_doctors/widgets/favourite_doctors_grid.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_search_bar.dart';
import 'package:grad_projectx2/widgets/featured_doctors.dart';

class FavouriteDoctorsScreen extends StatelessWidget {
  FavouriteDoctorsScreen({super.key});
  final FavouriteDoctorsController controller =
      Get.put(FavouriteDoctorsController());

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          const CustomAppBar(title: 'Favourite Doctors'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSearchBar(hintText: 'Dentist'),
                  SizedBox(
                    height: 24.h,
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return FavouriteDoctorsGrid(controller: controller);
                  }),
                  SizedBox(height: 29.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Feature Doctor',
                          style: AppTextStyles.headlineTitle),
                      Row(
                        children: [
                          Text('See all', style: AppTextStyles.doctorspecialty),
                          Icon(Icons.chevron_right,
                              size: 14.sp, color: const Color(0xFF6B7280)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  FeaturedDoctorsList(
                    doctors: controller.featureDoctors,
                    onFavoriteTap: (index) =>
                        controller.toggleFavorite(true, index),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
