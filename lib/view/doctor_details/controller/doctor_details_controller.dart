
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorDetailsController extends GetxController{
  var doctorName = 'Dr. Pediatrician'.obs;
  var doctorSpecialty = 'Specialist Cardiologist'.obs;
  var doctorRating = 4.0.obs;
  var doctorPrice = 280.obs;
  var doctorImage = 'assets/images/image1.png'.obs;
  var isFavorite = true.obs;
  
  RxInt runningCount = 100.obs;
  RxInt ongoingCount = 500.obs;
  RxInt patientCount = 700.obs;
  
  RxList<String> services = <String>[
    'Patient care should be the number one priority.',
    'If you run your practiceyou know how frustrating.',
    'That\'s why some of appointment reminder system.',
  ].obs;

  Rx<LatLng?> currentLocation = Rx<LatLng?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void bookAppointment() {
    Get.toNamed('/doctor_appointment');
  }
}