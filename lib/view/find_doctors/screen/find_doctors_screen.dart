import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/view/my_doctors/controller/my_doctors_controller.dart';
import 'package:grad_projectx2/widgets/custom_search_bar.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:grad_projectx2/widgets/custom_doctor_card.dart';

import '../my_doctors/my_doctors_controller/my_doctors_controller.dart';

class FindDoctorsScreen extends StatelessWidget {
  FindDoctorsScreen({super.key});
  final MyDoctorsController controller = Get.put(MyDoctorsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
          child: Column(
        children: [
          const CustomAppBar(
            title: 'Find Doctors',
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomSearchBar(
            hintText: 'Dentist',
          ),
          SizedBox(height:24.h,),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorCard(
                    imagePath: 'assets/images/dr_tranquilli.png',
                    name: 'Dr. Shruti Kedia',
                    specialty: 'Tooths Dentist',
                    experience: '7',
                    rating: '87',
                    reviews: '69',
                    nextTimeAvailable: "10:00",
                    nextDateAvailable: " AM tomorrow",
                    onBook: () {
                      Get.toNamed(AppRoutes.selectTime);
                    },
                  ),
                  DoctorCard(
                    imagePath: 'assets/images/dr_bonebrake.png',
                    name: 'Dr.Watamaniuk',
                    specialty: 'Specialist Dentist',
                    experience: '7',
                    rating: '74',
                    reviews: '78',
                    nextTimeAvailable: "12:00",
                    nextDateAvailable: " AM tomorrow",
                    onBook: () {
                      Get.toNamed(AppRoutes.selectTime);
                    },
                  ),
                  DoctorCard(
                    imagePath: 'assets/images/dr_luke.png',
                    name: 'Dr. Crownover',
                    specialty: 'Tooths Dentist',
                    experience: '5',
                    rating: '59',
                    reviews: '86',
                    nextTimeAvailable: "11:00",
                    nextDateAvailable: " AM tomorrow",
                    onBook: () {
                      Get.toNamed(AppRoutes.selectTime);
                    },
                  ),
                  DoctorCard(
                    imagePath: 'assets/images/dr_shoemaker.png',
                    name: 'Dr. Balestra',
                    specialty: 'Tooths Dentist',
                    experience: '6',
                    rating: '87',
                    reviews: '69',
                    nextTimeAvailable: "10:00",
                    nextDateAvailable: " AM tomorrow",
                    onBook: () {
                      Get.toNamed(AppRoutes.selectTime);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
