import 'package:get/get.dart';

class FindDoctorsController extends GetxController{
  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}