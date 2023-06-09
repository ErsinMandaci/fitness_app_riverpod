import 'dart:convert';

import 'package:fitness_app/product/constants/string_constants.dart';
import 'package:fitness_app/product/models/exercises.dart';
import 'package:http/http.dart' as http;

class ExcercisesService {
  Future<List<Exercises>?> fetchData() async {
    var exercisesUrlParse = Uri.parse(StringConstants.apiPath);

    final response = await http.get(exercisesUrlParse, headers: {
      'X-Api-Key': '1231231232131233',
    });

    if (response.statusCode == 200) {
      final List<dynamic> jsonBody = jsonDecode(response.body);

      return jsonBody.map((e) => Exercises.fromJson(e)).toList();
    }

    throw Exception('Exercises verisi yüklenemedi');
  }
}
