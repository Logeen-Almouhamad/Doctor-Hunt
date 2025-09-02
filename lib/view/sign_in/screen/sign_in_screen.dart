import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/forgot_password/forgot_bottom_sheet.dart';
import 'package:grad_projectx2/view/sign_in/controller/sign_in_controller.dart';
import 'package:grad_projectx2/view/sign_up/controller/signup_controller.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_text.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    return CustomBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20.w,127.h,20.w,1.h),
              child: Form(
                key: controller.formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(AppText.welcomeText,style: AppTextStyles.textStyleBlack24w500,),
                      SizedBox(height: 8.h,),
                      Center(
                        child: Text(AppText.subSignText,textAlign: TextAlign.center,

                          style: AppTextStyles.textStyleGrey14w400,

                        ),
                      ),
                      SizedBox(height: 72.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 54.h,
                            width: 156.w,
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
                              padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.gmailIcon,
                                    height: 18.17.h,
                                    width: 18.17.w,),
                                  SizedBox(width: 12.8.w,),
                                  Text(AppText.googleText,
                                    style: AppTextStyles.textStyleGrey16w300,),
                                ],),
                            ),
                          ),

                          SizedBox(width: 20.w,),
                          Container(
                            height: 54.h,
                            width: 156.w,
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
                              padding: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 10.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.facebookIcon,
                                    height: 18.17.h,
                                    width: 18.17.w,),
                                  SizedBox(width: 12.8.w,),
                                  Text(AppText.facebookText,
                                    style: AppTextStyles.textStyleGrey16w300,),
                                ],),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h,),
                      MyTextFormField(
                        controller: controller.emailController,
                        borderColor : AppColors.sizedBoxBorderColor,
                        labelText: AppText.emailLabelSignInText,
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: Icon(Icons.check,color: AppColors.backArrowColor,),
                        validator: (val) =>
                        !GetUtils.isEmail(val!) ? "Enter valid email" : null,
                      ),
                      SizedBox(height: 16.h),
                      Obx(() => MyTextFormField(
                        controller: controller.passwordController,
                        borderColor : AppColors.sizedBoxBorderColor,
                        labelText: AppText.loginPasswordLabelText,
                        obscureText: controller.isObscure.value,
                        validator: (val) =>
                        val!.isEmpty ? "Enter your password" : null,
                        suffixIcon: IconButton(
                          icon: Icon(controller.isObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      )),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10.w, 32.h, 10.w, 5.h),
                        child: CustomButton(
                          text: AppText.logInText,
                          onPressed: () async {
                            if (kDebugMode) {
                              print('🟢 Login button pressed');
                            }
                            await controller.loginUser();
                            Get.offNamed(AppRoutes.main);
                          },
                        ),
                      ),




                      Center(child: TextButton(child: Text(AppText.forgotPasswordButton,
                        style: AppTextStyles.textStyleGreen14w400,),
                        onPressed: (){
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          barrierColor: AppColors.backgroundColorBehindBottomSheet,
                          backgroundColor: Colors.transparent,
                          builder: (_) => const ForgotPasswordBottomSheet(),
                        );},)),
                      SizedBox(height: 100.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppText.doNotHaveAnAccountText,
                            style: AppTextStyles.textStyleGreen14w400,
                          ),
                          TextButton(
                            onPressed: (){
                              Get.delete<SignupController>();
                              Get.offNamed(AppRoutes.signUp);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(left: 4.w),
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),

                            child: Text(AppText.joinUsButton,
                              style: AppTextStyles.textStyleGreen14w400,),
                          ),
                        ],
                      ),
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
