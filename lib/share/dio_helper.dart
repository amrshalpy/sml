import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000,
        baseUrl: "https://shoppingoo00099.herokuapp.com/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // post
  static Future<Response> postData({
    required String path,
    String? token,
    required dynamic data,
    // Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "token": "Bearer $token",
    };
    return await dio.post(
      path,
      data: data,
    );
  }

  //get
  static Future<Response> getData({
    String? path,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "token": "Bearer $token",
    };
    return await dio.get(path!, queryParameters: query);
  }

  //put
  static Future<Response> putData({
    String? path,
    String? token,
     dynamic data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "token": "Bearer $token",
    };
    return await dio.put(path!, data: data, queryParameters: query);
  }

  //delete
  static Future<Response> deleteData({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "token": "Bearer $token",
    };
    return await dio.delete(path!, data: data, queryParameters: query);
  }
}
