import '../src/data/client/http_exception.dart';
import '../src/data/client/http_response.dart';

class LoginException extends HttpExceptionCustom {
   HttpResponse? httpResponse;

   LoginException({this.httpResponse,});
}



class LoginServerNotFound extends LoginException {
  final String msg;

  LoginServerNotFound({required this.msg,  });
}
