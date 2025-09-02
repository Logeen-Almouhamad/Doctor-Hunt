import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/popular_doctor/controller/popular_doctor_controller.dart';
import 'package:grad_projectx2/view/popular_doctor/widgets/popular_doctor_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/doctors_cards.dart';
import 'package:grad_projectx2/widgets/popular_doctors_list.dart';
import 'package:grad_projectx2/model/favourite_doctor_model.dart';

class PopularDoctorScreen extends StatelessWidget {
  const PopularDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PopularDoctorController());
    return CustomBackground(
        child: Column(
      children: [
        const PopularDoctorAppBar(),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Doctor', style: AppTextStyles.headlineTitle),
                    Row(
                      children: [
                        Text('See all', style: AppTextStyles.doctorspecialty),
                        Icon(Icons.chevron_right,
                            size: 14.sp, color: AppColors.backArrowColor),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 22.h),
                PopularDoctorsList(popularDoctors: controller.popularDoctors),
                SizedBox(height: 20.h),
                Text('Category', style: AppTextStyles.headlineTitle),
                SizedBox(height: 17.h),
                DoctorsCards(
                  doctor: FavouriteDoctorModel(
                    name: 'Dr.Pediatrician',
                    specialty: 'Specialist Cardiologist',
                    rating: 2.8,
                    image: AppImages.doctorsCardImage1,
                    salary: '\$150',
                    isFavorite: true,
                  ),
                  index: 0,
                ),
                SizedBox(
                  height: 13.h,
                ),
                DoctorsCards(
                  doctor: FavouriteDoctorModel(
                    name: 'Dr. Mistry Brick',
                    specialty: 'Specialist Dentist ',
                    rating: 2.8,
                    image: AppImages.doctorsCardImage2,
                    salary: '\$150',
                    isFavorite: true,
                  ),
                  index: 1,
                ),
                SizedBox(
                  height: 13.h,
                ),
                DoctorsCards(
                  doctor: FavouriteDoctorModel(
                    name: 'Dr. Ether Wall',
                    specialty: 'Specialist Cancer',
                    rating: 2.8,
                    image: AppImages.doctorsCardImage3,
                    salary: '\$150',
                    isFavorite: true,
                  ),
                  index: 2,
                ),
                SizedBox(
                  height: 13.h,
                ),
                DoctorsCards(
                  doctor: FavouriteDoctorModel(
                    name: 'Dr. Johan smith',
                    specialty: 'Specialist cardiologist',
                    rating: 2.8,
                    image: AppImages.doctorsCardImage4,
                    salary: '\$150',
                    isFavorite: true,
                  ),
                  index: 3,
                ),
                SizedBox(
                  height: 13.h,
                ),
                DoctorsCards(
                  doctor: FavouriteDoctorModel(
                    name: 'Dr. Johan smith',
                    specialty: 'Specialist cardiologist',
                    rating: 2.8,
                    image: AppImages.doctorsCardImage4,
                    salary: '\$150',
                    isFavorite: true,
                  ),
                  index: 4,
                ),
                SizedBox(
                  height: 13.h,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
