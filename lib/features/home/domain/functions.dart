import 'dart:convert';
import 'package:cat_app/features/home/domain/model/catdetalils.dart';
import 'package:http/http.dart' as http;

class CatRepo {
  String catUrl =
      'https://api.thecatapi.com/v1/images/search?limit=100&has_breeds=1&api_key=live_AvkMaAmZQH0dAO6Mqj2qla9WtRzR4YfMzZSnfiBJfkRXyROj5G9z2mhaElrgAjMt';

  Future<List<Root?>> getCats() async {
    final response = await http.get(Uri.parse(catUrl));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      final List<Root?> roots = [];
      for (dynamic x in result) {
        roots.add(Root.fromJson(x));
      }
      return roots;
    } else {
      throw Exception('Failed to load cat breeds');
    }
  }
}
