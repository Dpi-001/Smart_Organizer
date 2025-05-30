import 'package:dio/dio.dart';
import 'package:smartapi/constants/api_constants.dart';
import 'package:smartapi/core/apis/custom_dio_exception.dart';

class ApiCalls {
  Future<dynamic> postData({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.apiBaseUrl));
      final response = await dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      // Handle Dio exceptions
      throw CustomDioException.fromDioError(e);
    }
  }
}
