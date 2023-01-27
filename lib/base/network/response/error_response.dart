
import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  List<ErrorItem>? errors;

  ErrorResponse({this.errors});

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

@JsonSerializable()
class ErrorItem {
  String? status;
  String? detail;
  String? code;
  dynamic meta;

  ErrorItem({this.status, this.detail});

  Map<String, dynamic> toJson() => _$ErrorItemToJson(this);

  factory ErrorItem.fromJson(Map<String, dynamic> json) =>
      _$ErrorItemFromJson(json);

}