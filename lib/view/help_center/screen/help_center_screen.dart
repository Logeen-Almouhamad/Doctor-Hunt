import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/view/help_center/controller/help_center_controller.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});
  final conroller = Get.put(HelpCenterController());

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          const CustomAppBar(title: "Help center"),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: AppColors.blackColor.withOpacity(0.05),
                  spreadRadius: 0,
                  blurRadius: 20,
                ),
              ],
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
            width: 335.w,
            height: 54.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
              child: Text(
                "I have an issue with",
                style: AppTextStyles.issueText,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
              child: ListView.builder(
                itemCount: conroller.helpCenterList.length,
                itemBuilder: (context, index) {
                  final data = conroller.helpCenterList[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data,
                            style: AppTextStyles.helpText,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.backArrowColor,
                            size: 12.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }
}
