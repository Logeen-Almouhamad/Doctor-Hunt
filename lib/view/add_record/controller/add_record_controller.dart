import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/model/record.dart';
import 'package:grad_projectx2/model/record_type_model.dart';

class AddRecordController extends GetxController {
  late TextEditingController nameTextController;
//date var
  Rx<DateTime> selectedDate = DateTime.now().obs;
  //selectedRecordType var
  Rx<RecordType?> selectedRecordType = Rx<RecordType?>(null);
  //record name var
  RxString recordName = ''.obs;
//allMedicalRecords list
  RxList<RecordModel> allMedicalRecords = <RecordModel>[].obs;
// types pf records List
  final List<RecordType> recordTypes = [
    RecordType(
      imagePath: AppImages.reportTypeIcon,
      name: 'Report',
      type: 'report',
    ),
    RecordType(
      imagePath: AppImages.prescriptionTypeIcon,
      name: 'Prescription',
      type: 'prescription',
    ),
    RecordType(
      imagePath: AppImages.invoiceTypeIcon,
      name: 'Invoice',
      type: 'invoice',
    ),
  ];

  static const List<String> monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
//on init
  @override
  void onInit() {
    super.onInit();
    addSampleRecords();
    nameTextController = TextEditingController();

    nameTextController.addListener(() {
      recordName.value = nameTextController.text;
    });

    // Optionally pre-select the first type
    selectedRecordType.value = recordTypes[0];
  }

//select date function
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      helpText: 'SELECT RECORD DATE',
      cancelText: 'CANCEL',
      confirmText: 'SELECT',
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.teal,
            colorScheme: ColorScheme.light(primary: Colors.teal),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

//selectRecordType
  void selectRecordType(RecordType type) {
    selectedRecordType.value = type;
  }

//get formatted date
  String get formattedDate {
    final date = selectedDate.value;
    return "${date.day.toString().padLeft(2, '0')} ${monthNames[date.month - 1]} ${date.year}";
  }

// Add record Function
  void addRecord() {
    if (nameTextController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a name for the record.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (selectedRecordType.value == null) {
      Get.snackbar(
        'Error',
        'Please select a record type.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final newRecord = RecordModel(
      name: nameTextController.text,
      type: selectedRecordType.value!.type,
      date: formattedDate,
    );
    allMedicalRecords.add(newRecord);

    nameTextController.clear();

    selectedDate.value = DateTime.now();
    selectedRecordType.value = recordTypes[0];

    Get.snackbar(
      'Success',
      'Record added successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void addSampleRecords() {
    allMedicalRecords.addAll([
      RecordModel(
        name: "Abdullah mamun",
        type: "Prescription",
        date: "27 FEB",
      ),
      RecordModel(
        name: "Abdullah shuvo",
        type: "Prescription",
        date: "28 FEB",
      ),
      RecordModel(
        name: "Shruti Kedia",
        type: "Prescription",
        date: "01 MAR",
      ),
    ]);
  }
}
