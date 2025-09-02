import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isTextMessagesOn = true.obs;
  var isPhoneCallsOn = true.obs;

  void toggleTextMessages(bool value) {
    isTextMessagesOn.value = value;
  }

  void togglePhoneCalls(bool value) {
    isPhoneCallsOn.value = value;
  }
}
