import 'package:get/get.dart';

class FavouriteDoctorModel {
  final String name;
  final String specialty;
  final double? rating;
  final String image;
  final String salary;
  RxBool isFavorite;

  FavouriteDoctorModel({
    required this.name,
    required this.specialty,
    required this.image,
    required this.salary,
    this.rating,
    required bool isFavorite,
  }) : isFavorite = RxBool(isFavorite);

  factory FavouriteDoctorModel.fromJson(Map<String, dynamic> json) {
    return FavouriteDoctorModel(
      name: json['name'] ?? '',
      specialty: json['specialty'] ?? '',
      image: json['image'] ?? '',
      salary: json['salary'] ?? '',
      rating: (json['rating'] as num?)?.toDouble(),
      isFavorite: json['is_favorite'] ?? false,
    );
  }
}
