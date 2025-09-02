import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/doctor_details/controller/doctor_details_controller.dart';
import 'package:grad_projectx2/view/doctor_details/widgets/doctor_details_card.dart';
import 'package:grad_projectx2/view/doctor_details/widgets/map_section.dart';
import 'package:grad_projectx2/view/doctor_details/widgets/services_section.dart';
import 'package:grad_projectx2/view/doctor_details/widgets/statistics_section.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';

class DoctorDetailsScreen extends StatelessWidget {
  DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorDetailsController());
    return CustomBackground(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomAppBar(title: 'Doctor Details'),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.findDoctors);
                  },
                    child: SvgPicture.asset(
                  AppImages.searchIcon,
                  width: 18.w,
                  height: 18.h,
                )),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorDetailsCard(controller: controller),
                  SizedBox(
                    height: 24.h,
                  ),
                  StatisticsSection(controller: controller),
                  SizedBox(
                    height: 27.h,
                  ),
                  ServicesSection(controller: controller),
                  SizedBox(
                    height: 30.h,
                  ),
                  MapSection(),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
