import 'package:get/get.dart';
import 'package:grad_projectx2/model/favourite_doctor_model.dart';
import 'package:grad_projectx2/serivces/crud_service.dart';
import 'package:grad_projectx2/core/constants/app_links.dart';
import 'package:grad_projectx2/core/constants/consts_data.dart';
import 'package:grad_projectx2/serivces/shared_preferences_service.dart';

class DoctorsController extends GetxController {
  var favoritesMap = <String, bool>{}.obs;
  var selectedCategory = 'All'.obs;
  final crudService = CrudService();

  void selectCategory(String category){
    selectedCategory.value = category;
  }

  Future<void> toggleFavorite(String name, String category) async {
    final isFav = favoritesMap[name] ?? false;

    final token = await SharedPreferencesService.getToken();
    final finalToken = token ?? 'your_test_token_here';

    final headers = {
      'Authorization': 'Bearer $finalToken',
      'apikey': API_KEY,
      'Content-Type': 'application/json',
    };

    if (isFav) {
      final deleteUrl =
          'https://nypnasqvpmjznqrbwhzl.supabase.co/rest/v1/favourite?name=eq.${Uri.encodeComponent(name)}';

      final response = await crudService.delete(deleteUrl, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 204) {
        favoritesMap[name] = false;
      }
    } else {
      final body = {"name": name, "category": category};
      final response = await crudService.post(AppLinks.addDoctors, headers: headers, body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        favoritesMap[name] = true;
      }
    }
  }
}
