import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/book_diagnostics_test/screen/book_diagnostics_test.dart';
import 'package:grad_projectx2/view/diagnostics_tests/widget/diagnostics_features_grid.dart';
import 'package:grad_projectx2/view/diagnostics_tests/widget/dynamic_card.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';

class DiagnosticsTestsScreen extends StatelessWidget {
  const DiagnosticsTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          const CustomAppBar(title: 'Diagonstics Tests'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text(
                    'Get Full body health checkups from the comfort of your home.',
                    style: AppTextStyles.headlineText,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Upto 45% off + get 10% healthcash back',
                      style: AppTextStyles.subHeadlineText,
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  const DiagnosticsFeaturesGrid(),
                  SizedBox(
                    height: 23.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Recommend for you",
                      style: AppTextStyles.headline,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  DynamicCard(
                    title: 'Advanced Young Indian Health Checkup',
                    subtitle: 'Ideal for individuals aged 21-40 years',
                    testCountText: '69 tests included',
                    imageUrl: AppImages.cardImage1,
                    price: '\$358',
                    discountedPrice: '\$330',
                    discountLabel: '35% off',
                    cashbackText: '+ 10% Health cashback T&C',
                    onBookNow: () {
                      Get.to(BookDiagnosticsTest());
                    },
                  ),
                  DynamicCard(
                    title: 'Working Women’s Health Checkup',
                    subtitle: 'Ideal for individuals aged 21-40 years',
                    testCountText: '119 tests included',
                    imageUrl: AppImages.cardImage2,
                    price: '\$387',
                    discountedPrice: '\$345',
                    discountLabel: '35% off',
                    cashbackText: '+ 10% Health cashback T&C',
                    onBookNow: () {
                      Get.to(BookDiagnosticsTest());
                    },
                  ),
                  DynamicCard(
                    title: 'Active Professional Health Checkup',
                    subtitle: 'Ideal for individuals aged 21-40 years',
                    testCountText: '100 tests included',
                    imageUrl: AppImages.cardImage3,
                    price: '\$457',
                    discountedPrice: '\$411',
                    discountLabel: '35% off',
                    cashbackText: '+ 10% Health cashback T&C',
                    onBookNow: () {
                      Get.to(BookDiagnosticsTest());
                    },
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
