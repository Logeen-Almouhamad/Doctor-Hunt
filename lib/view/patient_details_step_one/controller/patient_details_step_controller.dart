import 'package:get/get.dart';

class PatientDetailsStepController extends GetxController{
  var selectedGender =''.obs;

  void selectGender(String gender){
    selectedGender.value = gender;
  }
}