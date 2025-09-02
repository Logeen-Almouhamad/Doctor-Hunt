import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/view/medicine_orders/screen/medicine_orders_screen.dart';


class LocationController extends GetxController {
  var isLoading = false.obs;

  ///checkAndNavigateForMedicineOrder
  Future<void> checkAndNavigateForMedicineOrder() async {
    debugPrint('LocationController: checkAndNavigateForMedicineOrder called.');
    isLoading.value = true;
   // try {
   //   debugPrint(
     //     'LocationController: Checking if location services are enabled...');
    //  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //  debugPrint(
    //      'LocationController: Location service enabled status: $serviceEnabled');

    //  if (!serviceEnabled) {
     //   debugPrint(
     //       'LocationController: Location services are NOT enabled. Navigating to ServiceLocationScreen.');
      //  Get.to(() => ServiceLocationScreen());
      //   return;
      // }

      // debugPrint(
      //     'LocationController: Location services ARE enabled. Checking permission status...');
     // LocationPermission permission = await Geolocator.checkPermission();
     // debugPrint('LocationController: Location permission status: $permission');

      // if (permission == LocationPermission.denied) {
      //   debugPrint(
      //       'LocationController: Permission denied. Requesting permission...');
      //   permission = await Geolocator.requestPermission();
      //   debugPrint(
      //       'LocationController: Permission status after request: $permission');

        // if (permission == LocationPermission.denied) {
        //   debugPrint(
        //       'LocationController: Permission still denied after requesting. Showing snackbar.');
        //   Get.snackbar(
        //     'Permission Denied',
        //     'Location permission is required to order medicines. Please grant the permission.',
        //     snackPosition: SnackPosition.BOTTOM,
        //     backgroundColor: Colors.redAccent,
        //     colorText: Colors.white,
        //   );
        //   return;
        // }
      //}

      // if (permission == LocationPermission.deniedForever) {
      //   debugPrint(
      //       'LocationController: Permission permanently denied. Showing snackbar and suggesting settings.');
      //   Get.snackbar(
      //     'Permission Permanently Denied',
      //     'Location permission is permanently denied. Please enable it from your app settings.',
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.redAccent,
      //     colorText: Colors.white,
      //     mainButton: TextButton(
      //       onPressed: () {
      //       //  Geolocator.openAppSettings();
      //       },
      //       child: const Text('Open Settings',
      //           style: TextStyle(color: Colors.white)),
      //     ),
      //   );
      //   return;
      // }

      debugPrint(
          'LocationController: All checks passed. Navigating to Medicines screen.');
      Get.to(() => MedicineOrdersScreen());
      Get.snackbar(
        'Location Enabled',
        'Location services are active. Proceeding to medicine order.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    // } catch (e) {
    //   debugPrint('LocationController: An error occurred: $e');
    //   Get.snackbar(
    //     'Error',
    //     'An error occurred while checking location: $e',
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.redAccent,
    //     colorText: Colors.white,
    //   );
    // } finally {
    //   debugPrint('LocationController: Setting isLoading to false.');
    //   isLoading.value = false;
    // }
  }

  ///enableLocationAndProceed
  Future<void> enableLocationAndProceed() async {
    debugPrint('LocationController: enableLocationAndProceed called.');
    isLoading.value = true;
    try {
      debugPrint('LocationController: Opening device location settings.');
    //  await Geolocator.openLocationSettings();

      debugPrint('LocationController: Going back from ServiceLocationScreen.');
      Get.back();

      debugPrint(
          'LocationController: Re-running checkAndNavigateForMedicineOrder after settings.');
      await checkAndNavigateForMedicineOrder();
    } catch (e) {
      debugPrint('LocationController: Error opening location settings: $e');
      Get.snackbar(
        'Error',
        'An error occurred while trying to open location settings: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      debugPrint(
          'LocationController: Setting isLoading to false in enableLocationAndProceed.');
      isLoading.value = false;
    }
  }
}
