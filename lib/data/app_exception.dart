
class AppException implements Exception{
  String? message;
  String? prefix;

  AppException([this.message,this.prefix]);

  String toString(){
    return '$prefix$message';
  }

}

class InternetException extends AppException{
  InternetException([String? message]):super(message,'No internet');
}
class RequestTimeOut extends AppException{
  RequestTimeOut([String? message]):super(message,'Request time out');
}
class ServerException extends AppException{
  ServerException([String? message]):super(message,'Internal Server problem');

}

class InvalidUrlException extends AppException{
  InvalidUrlException([String? message]):super(message,'Invalid Url');

}
class ApiFetchException extends AppException{
  ApiFetchException([String? message]):super(message,' ');

}