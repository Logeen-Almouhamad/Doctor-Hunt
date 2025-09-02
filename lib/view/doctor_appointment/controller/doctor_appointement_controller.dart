import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/model/appointment_model.dart';
import 'package:grad_projectx2/model/reminder_model.dart';
import 'package:grad_projectx2/model/time_slot_model.dart';

class DoctorAppointementController extends GetxController{
  var times = <TimeSlotModel>[
    TimeSlotModel('10:00\nAM'),
    TimeSlotModel('12:00\nAM'),
    TimeSlotModel('02:00\nPM'),
    TimeSlotModel('03:00\nPM'),
    TimeSlotModel('04:00\nPM'),
  ].obs;

  var reminders = <ReminderModel>[
    ReminderModel('30\nMinit'),
    ReminderModel('40\nMinit'),
    ReminderModel('25\nMinit'),
    ReminderModel('10\nMinit'),
    ReminderModel('35\nMinit'),
  ].obs;

  var selectedTime = 2.obs;
  var selectedReminder = 2.obs;
  var selectedDay = DateTime.now().obs;

  var patientName = ''.obs;
  var contactNumber = ''.obs;
  var selectedPatientType = 0.obs;
  var isFavorite = true.obs;
  var doctorName = "Dr. Pediatrician".obs;
  var doctorSpecialty = "Specialist Cardiologist".obs;
  var doctorRating = 4.0.obs;
  var doctorViews = 120.obs;
  var doctorImage = "assets/images/image1.png".obs;
  var starSize = 15.0.sp.obs;


  AppointmentModel get appointment => AppointmentModel(
    selectedDay: selectedDay.value,
    selectedTimeIndex: selectedTime.value,
    selectedReminderIndex: selectedReminder.value,
  );

  void selectTime(int index) {
    selectedTime.value = index;
  }

  void selectReminder(int index) {
    selectedReminder.value = index;
  }

  void selectDay(DateTime day) {
    selectedDay.value = day;
  }

  void previousMonth() {
    selectedDay.value = DateTime(
      selectedDay.value.year,
      selectedDay.value.month - 1,
      selectedDay.value.day,
    );
  }

  void nextMonth() {
    selectedDay.value = DateTime(
      selectedDay.value.year,
      selectedDay.value.month + 1,
      selectedDay.value.day,
    );
  }
  void setPatientName(String name) {
    patientName.value = name;
  }

  void setContactNumber(String number) {
    contactNumber.value = number;
  }

  void selectPatientType(int type) {
    selectedPatientType.value = type;
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void bookAppointment() {
    if (patientName.value.isEmpty || contactNumber.value.isEmpty) {
      Get.snackbar(
        'خطأ',
        'يرجى ملء جميع الحقول المطلوبة',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.snackbar(
      'نجح',
      'تم حجز الموعد بنجاح',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToNextScreen() {
    // التنقل للصفحة التالية
    Get.toNamed('/select-time'); // أو أي مسار آخر
  }
}