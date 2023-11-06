class HttpResponse<T> {
  T? data;
  int? statusCode;
  String? message;

  HttpResponse({
    this.data,
    this.statusCode,
    this.message,
  });

  @override
  String toString() => 'HttpResponse(data: $data, statusCode: $statusCode, statusMessage: $message)';
}
