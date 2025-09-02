import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.editProfileBackgroundColor,
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Profile',
            titleColor: AppColors.whiteColor,
          ),
          SizedBox(height: 144.h,),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What is your name?',
                    style: AppTextStyles.customButtonText
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  TextField(
                    style: const TextStyle(color: AppColors.whiteColor),
                    decoration: InputDecoration(
                      hintText: 'Abdullah Mamun',
                      hintStyle: AppTextStyles.profileHintText,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.whiteColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.whiteColor, width: 1),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.whiteColor),
                      ),
                    ),
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
