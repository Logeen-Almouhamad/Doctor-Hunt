import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var isObscure = true.obs;

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  Future<void> loginUser() async {
    print('🔁 Attempting login...');

    if (!formKey.currentState!.validate()) {
      print('❌ Validation failed');
      return;
    }

    isLoading.value = true;

    try {
      // ⚠️ هذا هو التحقق الوهمي (يمكنك تغييره حسب الحاجة)
      await Future.delayed(const Duration(seconds: 2)); // تمثيل انتظار الشبكة

      final enteredEmail = emailController.text.trim();
      final enteredPassword = passwordController.text.trim();

      if (enteredEmail == 'test@example.com' && enteredPassword == '123456') {
        print('✅ Login successful (mocked)');

        // // تخزين بيانات وهمية
        // final myServices = Get.find<MyServices>();
        // await myServices.saveToken('dummy_token_123');
        // await myServices.saveUserId('1');
        //
        // // إعادة تحميل البيانات إن وُجدت
        // if (Get.isRegistered<ProfileController>()) {
        //   await Get.find<ProfileController>().reloadUser();
        // }

        Get.snackbar('Welcome', 'Login successful', backgroundColor: Colors.transparent);
        // Get.offAllNamed(AppRoutes.categories);
      } else {
        print('❌ Invalid credentials');
        Get.snackbar('Login Failed', 'Invalid email or password', backgroundColor: Colors.transparent);
      }
    } catch (e) {
      print('❌ Exception: $e');
      Get.snackbar('Error', 'Something went wrong: $e', backgroundColor: Colors.transparent);
    } finally {
      isLoading.value = false;
      print('🔚 Login process finished');
    }
  }

  Future<void> resetPassword() async {
    // محاكاة إرسال رابط إعادة تعيين كلمة المرور
    Get.snackbar('Reset Link Sent', 'A password reset link has been sent to your email',
        backgroundColor: Colors.transparent);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
