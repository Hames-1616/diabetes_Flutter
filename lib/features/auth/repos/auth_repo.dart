import 'package:diabetes_app/core/Failure.dart';
import 'package:diabetes_app/core/providers.dart';
import 'package:diabetes_app/core/type_def.dart';
import 'package:diabetes_app/features/auth/models/basicInfo.dart';
import 'package:diabetes_app/features/auth/models/createUser_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepoProvider =
    Provider((ref) => AuthRepo(cdio: ref.watch(dioProvider), cref: ref));

class AuthRepo {
  final Dio dio;
  final ProviderRef ref;

  AuthRepo({required Dio cdio, required ProviderRef cref})
      : dio = cdio,
        ref = cref;

  final url = "https://pear-walkingstick-gear.cyclic.app";
  FutureEither<String> createUser(CreateUser user) async {
    try {
      await dio.post("$url/createUser", data: user.toJson());
      return right("");
    } on DioException catch (e) {
      return left(Failure(e.response?.data["detail"]));
    }
  }

  FutureEither<String> loginUser(String email, String password) async {
    try {
      final response = await dio
          .get("$url/login", data: {"email": email, "password": password});

      final token = response.data["token"];
      final remember = await SharedPreferences.getInstance();
      await remember.setString("token", token);
      return right("");
    } on DioException catch (e) {
      return left(Failure(e.response?.data["detail"]));
    }
  }

  FutureEither<String> basicInfo(BasicInfo medDetails) async {
    try {
      dio.options.headers['token'] = await ref.watch(stringToken.future);
      await dio.post("$url/basicInfo", data: medDetails.toJson());
      final basic = await SharedPreferences.getInstance();
      await basic.setBool("basicToken",true);
      return right("");
    } on DioException catch (e) {
      return left(Failure(e.response?.data["detail"]));
    }
  }

    FutureEither<String> basicInfoVerify(BasicInfo medDetails) async {
    try {
      dio.options.headers['token'] = await ref.watch(stringToken.future);
      await dio.post("$url/basicInfoVerify");
      final basic = await SharedPreferences.getInstance();
      await basic.setBool("basicToken",true);
      return right("");
    } on DioException catch (e) {
      return left(Failure(e.response?.data["detail"]));
    }
  }
}
