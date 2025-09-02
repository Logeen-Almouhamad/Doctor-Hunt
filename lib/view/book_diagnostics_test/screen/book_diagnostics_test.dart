import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/view/patient_details/screen/patient_details.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';

class BookDiagnosticsTest extends StatelessWidget {
  const BookDiagnosticsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          //app bar
          CustomAppBar(title: " Diagonstics Tests"),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 94.h,
                  ),

                  //logo
                  Image.asset(AppImages.diagonsticsLogoImage),
                  SizedBox(
                    height: 41.h,
                  ),

                  //text
                  Text(
                    "You haven't booked any tests yet",
                    style: AppTextStyles.underLogoHeadlineText,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Get started with your first health checkup",
                    style: AppTextStyles.underLogoSubText,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 33.h,
                  ),

                  //Book Now Button
                  CustomButton(
                    onPressed: () {
                      Get.to(const PatientDetails());
                    },
                    text: "Book Now",
                  ),
                  SizedBox(
                    height: 267.h,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}