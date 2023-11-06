// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'http_response.dart';

class HttpExceptionCustom {
  String? message;
  int? statusCode;

  HttpResponse? response;

  HttpExceptionCustom({
    this.message,
    this.statusCode,
     this.response,
  });
}
