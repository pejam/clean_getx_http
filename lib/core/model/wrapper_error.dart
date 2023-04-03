import 'package:json_annotation/json_annotation.dart';

import '../error_handling/exception_handler.dart';


class WrapperError implements ExceptionHandler {

  final int? statusCode;

  final String? message;

  String? description;

  int? type;

  int? systemErrorId;

  WrapperError(
      {this.statusCode,
      this.message,
      this.description,
      this.type,
      this.systemErrorId})
      : super();

/*factory WrapperError.fromJson(Map<String, dynamic> json) =>
      _$WrapperErrorFromJson(json);

  dynamic toJson() => _$WrapperErrorToJson(this);*/
}
