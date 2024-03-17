import 'package:dio/dio.dart';

var dioOptions = BaseOptions(
  //https://
  baseUrl: 'http://222.116.20.108:8000/api',
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 5),
);
