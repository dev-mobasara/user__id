import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:users_id/model/model.dart';

class APIService {
  Future<List<UserModel>> fetchUserModel() async {
    final response = await http.get(
      Uri.parse(
          'https://metaspook.github.io/json_api/json/products_gadget.json'),
    );

    if (response.statusCode == 200) {
      final user = [
        for (final users in jsonDecode(response.body))
          UserModel.fromJson(users as Map<String, dynamic>)
      ];
      return user;
    } else {
      throw Exception("Failed to load");
    }
  }
}
