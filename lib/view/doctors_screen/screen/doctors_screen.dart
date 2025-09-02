import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/widgets/category_filter.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_search_bar.dart';
import 'package:grad_projectx2/widgets/doctors_cards.dart';
import 'package:grad_projectx2/model/favourite_doctor_model.dart';

import '../../my_doctors/controller/my_doctors_controller.dart';

class DoctorsScreen extends StatelessWidget {
   DoctorsScreen({super.key});
  final FavoriteController controller = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          const CustomAppBar(title: 'Doctors'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar
                  const CustomSearchBar(hintText: 'Search',),
                  SizedBox(
                    height: 24.h,
                  ),
                  const CategoryFilter(),
                  SizedBox(
                    height: 24.h,
                  ),
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
                  SizedBox(height: 13.h,),
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
                  SizedBox(height: 13.h,),
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
                  SizedBox(height: 13.h,),
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
                  SizedBox(height: 13.h,),
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
                  SizedBox(height: 13.h,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
