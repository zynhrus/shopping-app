import 'package:dio/dio.dart';
import 'package:fit_hub_project/config/models/api_error_model.dart';
import 'package:fit_hub_project/constant/constant.dart';

class RestApiService {
  final Dio dio;

  const RestApiService({required this.dio});

  final _baseUrl = "https://dummyjson.com";

  Future<Response> get(
    String pathUrl, {
    Map<String, String?>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      String _pathUrl = _baseUrl + pathUrl;
      final response = await dio.get(_pathUrl,
          queryParameters: body, options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      String _pathUrl = _baseUrl + pathUrl;

      final response = await dio.post(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));

      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> delete(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      String _pathUrl = _baseUrl + pathUrl;
      final response = await dio.delete(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> put(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      String _pathUrl = _baseUrl + pathUrl;
      final response = await dio.put(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> patch(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      String _pathUrl = _baseUrl + pathUrl;
      final response = await dio.patch(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Response _handleResponse(Response response) {
    final int statusCode = response.statusCode!;
    if (statusCode == 200 ||
        statusCode == 304 ||
        statusCode == 201 ||
        statusCode == 202) {
      return response;
    } else if (((response.data as Map<String, dynamic>)["error_code"]
            as String?) !=
        null) {
      throw ApiErrorModel.fromJson(response.data as Map<String, dynamic>);
    } else if (statusCode == 401) {
      throw BackendErrors.forbidden;
    } else {
      final resData = response.data as Map<String, dynamic>;
      throw BackendErrors.unknown.copyWith(
          statusCode: statusCode, message: resData["message"] as String);
    }
  }

  ApiErrorModel _handleError(DioError e) {
    if (e.type == DioErrorType.connectionTimeout ||
        e.type == DioErrorType.receiveTimeout ||
        e.type == DioErrorType.sendTimeout) {
      return FrontendErrors.apiConnectionTimeout;
    }
    return BackendErrors.unknown
        .copyWith(statusCode: e.response?.statusCode, message: e.message);
  }
}
