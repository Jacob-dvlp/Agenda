import 'package:dio/dio.dart';
import '../../../helpers/login_failure.dart';
import 'http_exception.dart';
import 'http_response.dart';
import 'i_http.dart';

class HttpClient implements IHttp {
  late final Dio _dio;

  HttpClient({BaseOptions? baseOptions}) {
    _dio = Dio(baseOptions ?? _defaultOptions);
  }

  final _defaultOptions = BaseOptions(
    baseUrl: "https://dummyjson.com/",
  );
  @override
  Future<HttpResponse<T>> post<T>(String path,
      {data,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      return _trowRestClientException(e);
    }
  }


  @override
  Future<HttpResponse<T>> request<T>(String path,
      {data,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  Future<HttpResponse<T>> _dioResponseConverter<T>(
      Response<dynamic> response) async {
    return HttpResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      message: response.statusMessage,
    );
  }
  
  Never _trowRestClientException(DioException dioError) {
    final response = dioError.message;
    throw LoginException(
      httpResponse: HttpResponse(
        message: response
      ),
    );
  }
}
