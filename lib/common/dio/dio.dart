import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watso_v2/common/dio/dio_base.dart';

@riverpod
Dio dioProvider(ProviderRef ref) {
  final dio = Dio(dioOptions);
  return dio;
}
