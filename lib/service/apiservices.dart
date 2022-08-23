import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:users_id/model/model.dart';

class APIService {
  Future<List<UserModel>> fetchUserModel() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/comments',
      ),
    );

    if (response.statusCode == 200) {
      var user = [
        for (var users in jsonDecode(response.body)) UserModel.fromJson(users)
      ];
      return user;
    } else {
      throw Exception("Failed to load");
    }
  }
}
