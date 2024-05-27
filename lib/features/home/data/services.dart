import 'dart:convert';
import 'package:cat_app/core/app_secrets/secrets.dart';
import 'package:cat_app/features/home/domain/model/catdetalils.dart';
import 'package:http/http.dart' as http;

class CatRepo {
  String catUrl = AppSecrets.catApiURL;

  Future<List<CatModel?>> getCats() async {
    final response = await http.get(Uri.parse(catUrl));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      final List<CatModel?> catData = [];
      for (dynamic x in result) {
        catData.add(CatModel.fromJson(x));
      }
      return catData;
    } else {
      throw Exception('Failed to load cat breeds');
    }
  }
}
