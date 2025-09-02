import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:grad_projectx2/view/popular_doctor/controller/popular_doctor_controller.dart';

import '../../../model/doctor_date.dart';

class DoctorSelectTimeController extends GetxController {
  var isFavorite = false.obs;
  var selectedDateIndex = 0.obs;
  late DoctorModel doctor;
  var dates = <DoctorDate>[
    DoctorDate(label: 'Today, 23 Feb', slots: 'No slots available'),
    DoctorDate(label: 'Tomorrow, 24 Feb', slots: '9 slots available'),
    DoctorDate(label: 'Thu, 25 Feb', slots: '10 slots available'),
    DoctorDate(label: 'Fri, 26 Feb', slots: '5 slots available'),
  ].obs;
  void selectDate(int index) {
    selectedDateIndex.value = index;
  }
  void onInit() {
    super.onInit();
    doctor = DoctorModel(
      name: "Dr. Shruti Kedia",
      specialty: "Upasana Dental Clinic, salt lake",
      rating: 4.0, isFavorite: true,  image: '',

    );

  }
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}