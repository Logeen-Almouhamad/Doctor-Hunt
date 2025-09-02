import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/view/sign_in/controller/sign_in_controller.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_text_form_field.dart';
import 'otp_bottom_sheet.dart';

class ForgotPasswordBottomSheet extends StatelessWidget {
  const ForgotPasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          height: 390.h,
          width: double.infinity,
          padding: EdgeInsets.only(top: 75.h, left: 19.w, right: 19.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppText.forgotPasswordButton,
                  style: AppTextStyles.textStyleBlack24w500),
              SizedBox(
                height: 20.h,
              ),
              Text(AppText.subTextBottomSheet1,
                  style: AppTextStyles.textStyleGrey14w400),
              SizedBox(height: 36.h),
              Center(
                child: MyTextFormField(
                  controller: controller.emailController,
                  borderColor: AppColors.sizedBoxBorderColor,
                  labelText: AppText.emailLabelText,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) =>
                      !GetUtils.isEmail(val!) ? "Enter valid email" : null,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: CustomButton(
                  text: AppText.continueTextButton,
                  onPressed: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      barrierColor: AppColors.backgroundColorBehindBottomSheet,
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const OtpBottomSheet(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
