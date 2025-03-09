import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        String? accessToken = prefs.getString('access_token');
        if (accessToken != null) {
          options.headers["Authorization"] = "Bearer $accessToken";
        }
        return handler.next(options);
      },
      onError: (DioError e, handler) async {
        if (e.response?.statusCode == 401) {
          bool refreshed = await _refreshToken();
          if (refreshed) {
            return handler.resolve(await _retry(e.requestOptions));
          }
        }
        return handler.next(e);
      },
    ));
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final prefs = await SharedPreferences.getInstance();
    String? newAccessToken = prefs.getString('access_token');

    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        "Authorization": "Bearer $newAccessToken",
      },
    );

    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> _refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('refresh_token');

    if (refreshToken == null) return false;

    try {
      final response = await _dio.post(
        "https://ahmed808.pythonanywhere.com/api/jwt/refresh/",
        data: {"refresh": refreshToken},
      );

      if (response.statusCode == 200) {
        await prefs.setString('access_token', response.data["access"]);
        return true;
      }
    } catch (e) {
      print("Error refreshing token: $e");
    }
    return false;
  }

  Future<bool> post({required String endpoint, required Map<String, dynamic> data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300;
    } catch (e) {
      print("POST request failed: $e");
      return false;
    }
  }

  Future<bool> get({required String endpoint}) async {
    try {
      final response = await _dio.get(endpoint);
      return response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300;
    } catch (e) {
      print("GET request failed: $e");
      return false;
    }
  }
}
