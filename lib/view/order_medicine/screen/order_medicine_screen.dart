import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/view/enable_location_services/screen/enable_location_services_screen.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';

class OrderMedicineScreen extends StatelessWidget {
  const OrderMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          //app Bar
          const CustomAppBar(title: "Medicine Orders"),
          SizedBox(
            height: 94.h,
          ),

          //Logo
          Image.asset(AppImages.medicalOredersLogo),
          //Text
          Padding(
            padding: EdgeInsets.fromLTRB(36.w, 40.h, 36.w, 33.h),
            child: Column(
              children: [
                Text(
                  "No orders placed yet",
                  style: AppTextStyles.underLogoHeadlineText,
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  "place your first order now.",
                  style: AppTextStyles.underLogoSubText,
                ),
              ],
            ),
          ),
          //Order Medicines button
          CustomButton(
            onPressed: () {
              Get.to(const EnableLocationServicesScreen());
            },
            text: "Order Medicines",
          ),
        ],
      ),
    );
  }
}
