import 'dart:convert';

import 'package:fitness_app/product/constants/string_constants.dart';
import 'package:fitness_app/product/models/muscle_image.dart';
import 'package:fitness_app/product/models/name_image.dart';
import 'package:flutter/services.dart';

class ImageService {
  Future<List<MuscleImage>?> muscleImageFetchData() async {
    final String jsonPath = StringConstants.muscleJsonPath;
    final jsonString = await rootBundle.loadString(jsonPath);

    try {
      final List<dynamic> jsonData = json.decode(jsonString);

      return jsonData.map((e) => MuscleImage.fromJson(e)).toList();
    } catch (e) {
      throw Exception('MuscleImageService dataları yüklenemedi $e');
    }
  }

  Future<List<NameImage>?> nameImageFetchData() async {
    final String jsonPath = StringConstants.nameJsonPath;
    final jsonString = await rootBundle.loadString(jsonPath);

    try {
      final List<dynamic> jsonData = json.decode(jsonString);

      final getjsonData = jsonData.map((e) => NameImage.fromJson(e)).toList();
     
      return getjsonData;
    } catch (e) {
      throw Exception('NameImageService dataları yüklenemedi $e');
    }
  }
}
