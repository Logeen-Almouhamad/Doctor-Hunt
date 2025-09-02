import 'package:get/get.dart';
import 'package:grad_projectx2/model/doctor_date.dart';

class DoctorSelectTimeController2 extends GetxController{
  var dates = <DoctorDate>[
    DoctorDate(label: 'Today, 23 Feb', slots: 'No slots available'),
    DoctorDate(label: 'Tomorrow, 24 Feb', slots: '9 slots available'),
    DoctorDate(label: 'Thu, 25 Feb', slots: '10 slots available'),
    DoctorDate(label: 'Fri, 26 Feb', slots: '5 slots available'),
  ].obs;

  var doctorName = 'Dr. Shruti Kedia'.obs;
  var clinic = 'Upasana Dental Clinic, salt lake'.obs;
  var imagePath = 'assets/images/docImg.png'.obs;
  var rating = 4.0.obs;
  var isFavorite = true.obs;

  var selectedDateIndex = 0.obs;

  var afternoonSlots = [
    '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM', '3:30 PM', '4:00 PM',
  ].obs;
  var eveningSlots = [
    '5:00 PM', '5:30 PM', '6:00 PM', '6:30 PM', '7:00 PM',
  ].obs;

  var selectedSlot = ''.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void selectDate(int index) {
    selectedDateIndex.value = index;
  }

  void selectSlot(String slot) {
    selectedSlot.value = slot;
  }
}