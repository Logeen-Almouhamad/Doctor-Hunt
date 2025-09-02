import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/view/find_doctors/controller/find_doctors_controller.dart';
import 'package:grad_projectx2/widgets/custom_doctor_card.dart';

class MyDoctorsScreen extends StatelessWidget {
  const MyDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FindDoctorsController controller = Get.put(FindDoctorsController());
    return CustomBackground(
      child: Column(
        children: [
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
                        imagePath: 'assets/images/dr. Shruti Kedia.png',
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
                        imagePath: 'assets/images/dr_Watamaniuk.png',
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
                        imagePath: 'assets/images/dr_ Crownover.png',
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
                        imagePath: 'assets/images/dr_Balestra.png',
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
