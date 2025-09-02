import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_links.dart';
import 'package:grad_projectx2/core/constants/consts_data.dart';
import 'package:grad_projectx2/model/favourite_doctor_model.dart';
import 'package:grad_projectx2/serivces/crud_service.dart';
import 'package:grad_projectx2/serivces/shared_preferences_service.dart';

class FavouriteDoctorsController extends GetxController {
  final favouriteDoctors = <FavouriteDoctorModel>[].obs;
  final featureDoctors = <FavouriteDoctorModel>[].obs;
  final isLoading = false.obs;

  final CrudService crudService = CrudService();
  final String apiUrl = AppLinks.favouriteDoctors;

  final Map<String, String> doctorImageMap = {
    'Dr. Pediatrician': AppImages.favoriteDoctorImage1,
    'Dr. Mistry Brick': AppImages.favoriteDoctorImage2,
    'Dr. Shouey': AppImages.favoriteDoctorImage3,
    'Dr. Ether Wall': AppImages.favoriteDoctorImage4,
    'Dr. Youssef': AppImages.favoriteDoctorImage4,
  };

  @override
  void onInit() {
    super.onInit();
    fetchFavouriteDoctors();
  }

  // MARK: — Fetching
  Future<void> fetchFavouriteDoctors() async {
    try {
      isLoading.value = true;

      final response = await crudService.get(
        apiUrl,
        headers: await _buildAuthHeaders(),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        favouriteDoctors.value = data.map((item) {
          return FavouriteDoctorModel(
            name: item['name'] ?? '',
            specialty: item['specialty'] ?? item['category'] ?? '',
            rating: (item['rating'] as num?)?.toDouble(),
            image: doctorImageMap[item['name']] ?? 'assets/images/beautiful_doctor.png',
            isFavorite: item['is_favorite'] ?? false,
            salary: item['salary'] ?? '',
          );
        }).toList();
      } else {
        print('Error fetching favorites: ${response.statusCode} → ${response.body}');
      }
    } catch (e) {
      print('Exception while fetching: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // MARK: — Toggle Favorite (Used in feature doctors)
  Future<void> toggleFavorite(bool isFeature, int index) async {
    final doctor = isFeature ? featureDoctors[index] : favouriteDoctors[index];
    final headers = await _buildAuthHeaders();

    if (doctor.isFavorite.value) {
      // Delete doctor from Supabase
      final deleteUrl =
          'https://nypnasqvpmjznqrbwhzl.supabase.co/rest/v1/favourite?name=eq.${Uri.encodeComponent(doctor.name)}';

      final response = await crudService.delete(deleteUrl, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 204) {
        if (!isFeature) {
          favouriteDoctors.removeAt(index);
        } else {
          doctor.isFavorite.value = false;
        }
      } else {
        print('Failed to delete: ${response.body}');
      }
    } else {
      // Add doctor to Supabase
      final body = {
        "name": doctor.name,
        "category": doctor.specialty,
      };

      final response = await crudService.post(
        AppLinks.addDoctors,
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

  // MARK: — Delete from Favourites (used in Favourite screen only)
  Future<void> deleteDoctorFromFavourites(int index) async {
    final doctor = favouriteDoctors[index];
    final headers = await _buildAuthHeaders();

    final deleteUrl =
        'https://nypnasqvpmjznqrbwhzl.supabase.co/rest/v1/favourite?name=eq.${Uri.encodeComponent(doctor.name)}';

    final response = await crudService.delete(deleteUrl, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 204) {
      favouriteDoctors.removeAt(index);
      print('Doctor "${doctor.name}" removed from favourites.');
    } else {
      print('Failed to delete: ${response.body}');
    }
  }

  // MARK: — Helpers
  Future<Map<String, String>> _buildAuthHeaders() async {
    final token = await SharedPreferencesService.getToken();
    final testToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'; // Keep this as fallback only in dev
    final finalToken = token ?? testToken;

    return {
      'Authorization': 'Bearer $finalToken',
      'apikey': API_KEY,
      'Content-Type': 'application/json',
    };
  }
}
