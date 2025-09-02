import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/sign_in/controller/sign_in_controller.dart';
import 'package:grad_projectx2/view/sign_up/controller/signup_controller.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';
import 'package:grad_projectx2/widgets/my_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return CustomBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 17.w,
                right: 19.w,
                top: 125.h,
              ),
              child: Form(
                key: controller.formKey,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppText.mainSignUpText,
                        style: AppTextStyles.textStyleBlack24w500,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Center(
                        child: Text(
                          AppText.subSignText,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.textStyleGrey14w400,
                        ),
                      ),
                      SizedBox(
                        height: 67.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 54.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadowColor,
                                  offset: const Offset(0, 0),
                                  blurRadius: 22,
                                  spreadRadius: 0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppImages.gmailIcon,
                                    height: 18.17.h,
                                    width: 18.17.w,
                                  ),
                                  SizedBox(
                                    width: 12.83.w,
                                  ),
                                  Text(
                                    AppText.googleText,
                                    style: AppTextStyles.textStyleGrey16w300,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Container(
                            height: 54.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadowColor,
                                  offset: const Offset(0, 0),
                                  blurRadius: 22,
                                  spreadRadius: 0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppImages.facebookIcon,
                                    height: 18.17.h,
                                    width: 18.17.w,
                                  ),
                                  SizedBox(
                                    width: 12.83.w,
                                  ),
                                  Text(
                                    AppText.facebookText,
                                    style: AppTextStyles.textStyleGrey16w300,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      MyTextFormField(
                        controller: controller.nameController,
                        borderColor: AppColors.sizedBoxBorderColor,
                        labelText: AppText.nameLabelText,
                        validator: (val) =>
                            val!.isEmpty ? "Enter your name" : null,
                      ),
                      SizedBox(height: 18.h),
                      MyTextFormField(
                        controller: controller.emailController,
                        labelText: AppText.emailLabelText,
                        borderColor: AppColors.sizedBoxBorderColor,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => !GetUtils.isEmail(val!)
                            ? "Enter valid email"
                            : null,
                      ),
                      SizedBox(height: 18.h),
                      Obx(() => MyTextFormField(
                            controller: controller.passwordController,
                            labelText: AppText.passwordLabelText,
                            borderColor: AppColors.sizedBoxBorderColor,
                            obscureText: controller.isObscure.value,
                            validator: (val) =>
                                val!.length < 6 ? "Min 6 characters" : null,
                            suffixIcon: IconButton(
                              icon: Icon(controller.isObscure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          )),
                      SizedBox(height: 15.h),
                      Obx(() => GestureDetector(
                            onTap: () {
                              controller.isAccepted.value =
                                  !controller.isAccepted.value;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.radioColor,
                                  ),
                                  child: controller.isAccepted.value
                                      ? Center(
                                          child: Container(
                                            width: 10.w,
                                            height: 10.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        )
                                      : null,
                                ),
                                SizedBox(width: 11.w),
                                Text(
                                  AppText.agreeText,
                                  style: AppTextStyles.textStyleGrey12w400,
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 45.h, bottom: 17.h),
                        child: CustomButton(
                          onPressed: () async {
                            await controller.createAccount();
                            Get.offNamed(AppRoutes.main);
                          },
                          text: AppText.signUpText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppText.haveAnAccountText,
                            style: AppTextStyles.textStyleGreen14w400,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.delete<SignInController>();
                              Get.toNamed(AppRoutes.signIn);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                            ),
                            child: Text(
                              AppText.logInTextWithSpace,
                              style: AppTextStyles.textStyleGreen14w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
