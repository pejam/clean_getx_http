import 'package:json_annotation/json_annotation.dart';

class WrapperResponse<T> {
  final T? body;

  int? statusCode;

  String? message;

  String? description;

  int? type;

  int? systemErrorId;

  WrapperResponse(
      {this.body,
      this.statusCode,
      this.message,
      this.description,
      this.type,
      this.systemErrorId});

/* factory WrapperResponse.fromJson(Map<String, dynamic> json) =>
      _$WrapperResponseFromJson<T>(json);

  dynamic toJson(Object Function(T value) toJsonT) =>
      _$WrapperResponseToJson(this, toJsonT);*/
}
