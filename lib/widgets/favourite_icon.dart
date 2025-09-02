import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../model/favourite_doctor_model.dart';
import '../view/favourite_doctors/controller/favourite_doctor_controller.dart';

class FavoriteIcon extends StatelessWidget {
  final FavouriteDoctorModel doctor;
  final int index;
  final bool isFromFavoritesScreen;
  final FavouriteDoctorsController controller = Get.find<FavouriteDoctorsController>();

  FavoriteIcon({
    super.key,
    required this.doctor,
    required this.index,
    this.isFromFavoritesScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.toggleFavorite(!isFromFavoritesScreen, index),
      child: Obx(() => Icon(
        doctor.isFavorite.value ? Icons.favorite : Icons.favorite_border,
        color: doctor.isFavorite.value ? Colors.red : Colors.grey,
        size: 20,
      )),
    );
  }
}
