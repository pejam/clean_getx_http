import 'failure.dart';

class ServerFailure extends Failure {

  String? message;
  String? code;

  ServerFailure({this.message, this.code});
}