// controllers/favorite_controller.dart
import 'package:get/get.dart';

class MyDoctorsController extends GetxController {
  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
