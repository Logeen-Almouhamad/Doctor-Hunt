import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text.dart';
import 'package:grad_projectx2/view/my_doctors/controller/my_doctors_controller.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_doctor_card.dart';
import 'package:grad_projectx2/widgets/custom_search_bar.dart';

import '../../favourite_doctors/controller/favourite_doctor_controller.dart';
import '../../find_doctors/my_doctors/my_doctors_controller/my_doctors_controller.dart';

class MyDoctorsScreen extends StatelessWidget {
  const MyDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavouriteDoctorsController controller = Get.put(FavouriteDoctorsController());
    //final MyDoctorsController controller = Get.put(MyDoctorsController());
    return CustomBackground(
      child: Column(
        children: [
          const CustomAppBar(title: AppText.myDoctorsText),
          const CustomSearchBar(hintText: 'search',),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      DoctorCard(
                        imagePath: 'assets/images/dr_tranquilli.png',
                        name: 'Dr. Tranquilli',
                        specialty: 'Specialist medicine',
                        experience: '6',
                        rating: '87',
                        reviews: '69',
                        nextTimeAvailable: "10:00",
                        nextDateAvailable: " AM tomorrow",
                        onBook: () {
                          Get.toNamed(AppRoutes.appointment);
                        },
                      ),
                      DoctorCard(
                        imagePath: 'assets/images/dr_bonebrake.png',
                        name: 'Dr. Bonebrake',
                        specialty: 'Specialist Dentist',
                        experience: '8',
                        rating: '59',
                        reviews: '82',
                        nextTimeAvailable: "12:00",
                        nextDateAvailable: " AM tomorrow",
                        onBook: () {
                          Get.toNamed(AppRoutes.appointment);
                        },
                      ),
                      DoctorCard(
                        imagePath: 'assets/images/dr_luke.png',
                        name: 'Dr. Luke Whitesell',
                        specialty: 'Specialist Cardiology',
                        experience: '7',
                        rating: '57',
                        reviews: '76',
                        nextTimeAvailable: "11:00",
                        nextDateAvailable: " PM today",
                        onBook: () {
                          Get.toNamed(AppRoutes.appointment);
                        },
                      ),
                      DoctorCard(
                        imagePath: 'assets/images/dr_shoemaker.png',
                        name: 'Dr. Shoemaker',
                        specialty: 'Specialist Patheology',
                        experience: '5',
                        rating: '87',
                        reviews: '69',
                        nextTimeAvailable: "11:00",
                        nextDateAvailable: " PM today",
                        onBook: () {
                          Get.toNamed(AppRoutes.appointment);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
