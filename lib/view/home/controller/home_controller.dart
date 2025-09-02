import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';


class PopularDoctorModel {
  final String name;
  final String image;
  final String specialty;
  final double rating;
  PopularDoctorModel({
    required this.name,
    required this.image,
    required this.specialty,
    required this.rating,

  });
}
//
class FeatureDoctorModel {
  final String name;
  final String image;
  final String salary;
  final double rating;
  final RxBool isFavorite;
  FeatureDoctorModel({
    required this.name,
    required this.image,
    required this.salary,
    required this.rating,
    required this.isFavorite,
  });
}
//
class HomeScreenController extends GetxController {
  RxList<PopularDoctorModel> popularDoctors = <PopularDoctorModel>[
    PopularDoctorModel(
      name: 'Dr. Fillerup Grab',
      image: AppImages.dr01,
      specialty: 'Medicine Specialist',
      rating: 4,

    ),
    PopularDoctorModel(
      name: 'Dr. Blessing',
      image: AppImages.dr02,
      specialty: 'Dentist Specialist',
      rating: 4,
    ),
  ].obs;
///
  RxList<FeatureDoctorModel> featuredDoctors = <FeatureDoctorModel>[
    FeatureDoctorModel(
      name: 'Dr. Crick',
      image: AppImages.dr001,
      salary: '25.00/ hours',
      rating: 3.7,
      isFavorite: false.obs,
    ),
    FeatureDoctorModel(
      name: 'Dr. Strain',
      image: AppImages.dr002,
      salary: '22.00/ hours',
      rating: 3.0,
      isFavorite: true.obs,
    ),
    FeatureDoctorModel(
      name: 'Dr. Lachinet',
      image: AppImages.dr003,
      salary: '29.00/ hours',
      rating: 2.9,
      isFavorite: false.obs,
    ),
    FeatureDoctorModel(
      name: 'Dr. Crick',
      image: AppImages.dr001,
      salary: '25.00/ hours',
      rating: 3.0,
      isFavorite: true.obs,
    ),
  ].obs;

  void toggleFavorite(int index) {
    featuredDoctors[index].isFavorite.value = !featuredDoctors[index].isFavorite.value;
  }

  var bottomNavIndex = 0.obs;

  void changeBottomNavIndex(int index) {
    bottomNavIndex.value = index;
  }

}