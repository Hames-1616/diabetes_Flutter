import 'package:diabetes_app/core/Failure.dart';
import 'package:diabetes_app/core/type_def.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepo {
  final Dio dio;

  AuthRepo({required Dio cdio}) : dio = cdio;

  final url = "https://diabetes-fast.onrender.com";
  FutureEither<String> createUser(
      String username, String email, String password) async {
    try {
      await dio.post("$url/createUser",
          data: {"username": username, "email": email, "password": password});
      return right("sucess");
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
