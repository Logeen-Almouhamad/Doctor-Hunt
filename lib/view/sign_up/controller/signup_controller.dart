import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isAccepted = false.obs;

  var isObscure = true.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  Future<void> createAccount() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {

      await Future.delayed(const Duration(seconds: 2));


      if (kDebugMode) {
        print("✅ Fake account created locally");
      }
      Get.snackbar('Success', 'Account created successfully',
          backgroundColor: Colors.green);

      // Simulate login
      await loginAfterSignup();
    } catch (e) {
      if (kDebugMode) {
        print("❌ Error: $e");
      }
      Get.snackbar('Error', 'Something went wrong: $e',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginAfterSignup() async {
    await Future.delayed(const Duration(seconds: 1));

    if (kDebugMode) {
      print("✅ Fake login success");
    }
    Get.snackbar('Login', 'Logged in successfully',
        backgroundColor: Colors.green);


    Get.offAllNamed('/categories');
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
