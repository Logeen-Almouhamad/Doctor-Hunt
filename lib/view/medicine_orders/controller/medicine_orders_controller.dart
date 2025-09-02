import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';

class MedicineOrdersController extends GetxController{
  final RxList<Map<String, String>> medicalCategories = <Map<String, String>>[
    {
      'image': AppImages.guideToMedicineOrederImage,
      'title': 'Guide to medicine order',
    },
    {
      'image': AppImages.presRelatedIsueeImage,
      'title': 'Prescription related issues',
    },
    {
      'image': AppImages.orderStatusImage,
      'title': 'Order status',
    },
    {
      'image': AppImages.orderDeleveryImage,
      'title': 'Order delivery',
    },
    {
      'image': AppImages.paymentFundsImage,
      'title': 'Payments & funds',
    },
    {
      'image': AppImages.orderReturnImage,
      'title': 'Order returns',
    },
  ].obs;
}