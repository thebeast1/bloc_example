import 'dart:convert';

import 'package:bloc_example/constants.dart';
import 'package:bloc_example/data/models/post.dart';
import 'package:dio/dio.dart';

class DemoWebServices {
  late Dio _dio;

  DemoWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: KBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    _dio = Dio(options);
  }

  Future<List<Post>> getAllPosts() async {
    try {
      Response response = await _dio.get(KPostEndPoint);

      return postFromJson(response.data);
    } catch (e) {
      print("-- web services Error This error from Demo Web Services $e");
      throw (e);
    }
  }
}
