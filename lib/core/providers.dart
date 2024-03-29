import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final baseoptionsProvider =
    Provider((ref) => BaseOptions(connectTimeout: const Duration(seconds: 10)));
final dioProvider = Provider((ref) => Dio(ref.read(baseoptionsProvider)));
final stringToken = FutureProvider((ref) async {
  final token = await SharedPreferences.getInstance();
  return token.getString("token");
});

final basicInfoCheck = FutureProvider((ref) async {
  final token = await SharedPreferences.getInstance();
  return token.getBool("basicToken");
});

final loginscreen = StateProvider<bool>((ref) => false);
final basicInfoPassed = StateProvider<bool>((ref) => false);
