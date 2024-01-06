import 'package:diabetes_app/core/Failure.dart';
import 'package:diabetes_app/core/providers.dart';
import 'package:diabetes_app/core/type_def.dart';
import 'package:diabetes_app/features/auth/models/createUser_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final authRepoProvider =
    Provider((ref) => AuthRepo(cdio: ref.watch(dioProvider)));

class AuthRepo {
  final Dio dio;

  AuthRepo({required Dio cdio}) : dio = cdio;

  final url = "https://diabetes-fast.onrender.com";
  FutureEither<String> createUser(CreateUser user) async {
    try {
      await dio.post("$url/createUser", data: user.toJson());
      return right("success");
    } on DioException catch (e) {
      return left(Failure(e.response?.data["detail"]));
      //
    }
  }
}
