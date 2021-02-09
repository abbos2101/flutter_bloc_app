import 'package:dio/dio.dart';
import 'package:flutter_bloc_app/data/model/user_model.dart';

class UserService {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";
  final Dio _dio = Dio();

  Future<List<UserModel>> getUsers() async {
    final String url = "${_baseUrl}users";
    try {
      Response response = await _dio.request(
        url,
        options: Options(method: "GET"),
      );
      if (response.statusCode == 200 && response.data != null)
        return (response.data as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
