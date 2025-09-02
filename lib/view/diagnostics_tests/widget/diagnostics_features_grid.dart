import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class DiagnosticsFeaturesGrid extends StatelessWidget {
  const DiagnosticsFeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 15.w,
      childAspectRatio: 2.2,
      children: [
        _FeatureCard(
          icon: AppImages.homeIcon,
          title: 'Free home',
          subtitle: 'Sample pickup',
          gradientColors: [
            AppColors.gridOneFirstColor,
            AppColors.gridOneSecondColor
          ],
        ),
        _FeatureCard(
          icon: AppImages.assisIcon,
          title: 'Practo',
          subtitle: 'associate labs',
          gradientColors: [
            AppColors.gridTwoFirstColor,
            AppColors.gridTwoSecondColor
          ],
        ),
        _FeatureCard(
          icon: AppImages.reportIcon,
          title: 'E-Reports in',
          subtitle: '24–72 hours',
          gradientColors: [
            AppColors.gridThreeFirstColor,
            AppColors.gridThreeSecondColor
          ],
        ),
        _FeatureCard(
          icon: AppImages.labIcon,
          title: 'Free follow-up',
          subtitle: 'with a doctor',
          gradientColors: [
            AppColors.gridFourFirstColor,
            AppColors.gridFourSecondColor
          ],
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final List<Color> gradientColors;
  final String icon;
  final String title;
  final String subtitle;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 49.56.w,
          height: 52.94.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 9.44.w),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.gridText),
              Text(subtitle, style: AppTextStyles.gridText),
            ],
          ),
        )
      ],
    );
  }
}
