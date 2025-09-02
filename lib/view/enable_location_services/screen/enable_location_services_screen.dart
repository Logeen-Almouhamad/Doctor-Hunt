import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/view/enable_location_services/controller/location_controller.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';

class EnableLocationServicesScreen extends StatelessWidget {
  const EnableLocationServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());

    return CustomBackground(
      child: Column(
        children: [
          //appBar
          const CustomAppBar(title: "Enable Location Service "),
          SizedBox(
            height: 94.h,
          ),
      
          //logo
          Image.asset(AppImages.enableLocationLogo),
      
          //Text
          Column(
            children: [
              SizedBox(
                height: 41.h,
              ),
              Text(
                "Location",
                style: AppTextStyles.underLogoHeadlineText,
              ),
              SizedBox(
                height: 19.h,
              ),
              Text(
                "Your location service is switched off. Please\n enable location to help us serve better",
                style: AppTextStyles.underLogoSubText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 33.h,
              )
            ],
          ),
      
          //enable location button
          CustomButton(
            onPressed: () {
              Get.toNamed(AppRoutes.medicineOrders);
            } ,
            text: "Enable Location",
          ),
        ],
      ),
    );
  }
}