import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseoptionsProvider =
    Provider((ref) => BaseOptions(connectTimeout: const Duration(seconds: 10)));
final dioProvider = Provider((ref) => Dio(ref.read(baseoptionsProvider)));
