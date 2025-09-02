import 'package:get/get.dart';

class DoctorModel {
  final String name;
  final String specialty;
  final double rating;
  RxBool isFavorite;
  final int? views;
  final String? image;

  DoctorModel({
    required this.name,
    required this.specialty,
    required this.rating,
    required bool isFavorite,
     this.views,
     this.image,
  }) : isFavorite = RxBool(isFavorite);
}

class PopularDoctorController extends GetxController {
  var popularDoctors = <DoctorModel>[
    DoctorModel(
      name: 'Dr. Truluck Nik',
      specialty: 'Medicine Specialist',
      rating: 4.8,
      isFavorite: false,
      views: 1200,
      image: 'assets/images/docimg3.png',
    ),
    DoctorModel(
      name: 'Dr. Tranquilli',
      specialty: 'Pathology Specialist',
      rating: 4.7,
      isFavorite: false,
      views: 1100,
      image: 'assets/images/img4.png',
    ),
    DoctorModel(
      name: 'Dr. Pediatrician',
      specialty: 'Specialist Cardiologist',
      rating: 2.4,
      isFavorite: true,
      views: 2475,
      image: 'assets/images/img5.png',
    ),
  ].obs;

  var categoryDoctors = <DoctorModel>[
    DoctorModel(
      name: 'Dr. Pediatrician',
      specialty: 'Specialist Cardiologist',
      rating: 2.4,
      isFavorite: true,
      views: 2475,
      image: 'assets/images/image2.png',
    ),
    DoctorModel(
      name: 'Dr. Mistry Brick',
      specialty: 'Specialist Dentist',
      rating: 2.8,
      isFavorite: false,
      views: 2893,
      image: 'assets/images/img5.png',
    ),
    DoctorModel(
      name: 'Dr. Ether Wall',
      specialty: 'Specialist Cancer',
      rating: 2.7,
      isFavorite: true,
      views: 2754,
      image: 'assets/images/img6.png',
    ),
    DoctorModel(
      name: 'Dr. Johan smith',
      specialty: 'Specialist cardiologist',
      rating: 3.0,
      isFavorite: false,
      views: 200,
      image: 'assets/images/img4.png',
    ),
  ].obs;

  void toggleFavorite(bool isPopular, int index) {
    if (isPopular) {
      popularDoctors[index].isFavorite.value = !popularDoctors[index].isFavorite.value;
    } else {
      categoryDoctors[index].isFavorite.value = !categoryDoctors[index].isFavorite.value;
    }
  }
} 