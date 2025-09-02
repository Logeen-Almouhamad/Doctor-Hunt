import 'package:get/get.dart';

import '../../../model/favourite_doctor_model.dart';
import '../../../serivces/crud_service.dart';


class FavoriteController extends GetxController {
  final crudService = CrudService();

  var featureDoctors = <FavouriteDoctorModel>[].obs;
  var favouriteDoctors = <FavouriteDoctorModel>[].obs;

  Future<Map<String, String>> _buildAuthHeaders() async {
    // Implement your token or authorization headers logic here
    return {
      'apikey': 'YOUR_API_KEY',
      'Authorization': 'Bearer YOUR_BEARER_TOKEN',
      'Content-Type': 'application/json',
    };
  }

  Future<void> toggleFavorite({required bool isFeature, required int index}) async {
    final doctor = isFeature ? featureDoctors[index] : favouriteDoctors[index];
    final headers = await _buildAuthHeaders();

    if (doctor.isFavorite.value) {
      // DELETE from Supabase
      final deleteUrl =
          'https://nypnasqvpmjznqrbwhzl.supabase.co/rest/v1/favourite?name=eq.${Uri.encodeComponent(doctor.name)}';

      final response = await crudService.delete(deleteUrl, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 204) {
        doctor.isFavorite.value = false;
        if (!isFeature) {
          favouriteDoctors.removeAt(index);
        }
      } else {
        print('Failed to delete: ${response.body}');
      }
    } else {
      // POST to Supabase
      final body = {
        "name": doctor.name,
        "category": doctor.specialty,
      };

      final response = await crudService.post(
        'https://nypnasqvpmjznqrbwhzl.supabase.co/rest/v1/favourite',
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        doctor.isFavorite.value = true;
        if (!favouriteDoctors.any((d) => d.name == doctor.name)) {
          favouriteDoctors.add(doctor);
        }
      } else {
        print('Failed to add: ${response.body}');
      }
    }
  }
}
