import 'package:japx/japx.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  Data<T>? data;
  MetaResponse? meta;

  BaseResponse({this.data});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class BaseListResponse<T> {
  MetaResponse? meta;

  List<Data<T>>? data;

  BaseListResponse({this.meta, this.data}) : super();

  factory BaseListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) =>
      _$BaseListResponseToJson(this, toJsonT);
}

@JsonSerializable()
class MetaResponse {
  int? totalRecordCount;
  int? currentRecordCount;
  int? totalPage;
  int? currentPage;
  int? perPage;
  int? startOf;

  MetaResponse({
    this.totalRecordCount,
    this.currentRecordCount,
    this.totalPage,
    this.currentPage,
    this.perPage,
    this.startOf,
  });

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class Data<T> {
  String? id;
  String type;
  T attributes;

  Data({this.id, required this.type, required this.attributes});

  factory Data.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$DataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$DataToJson(this, toJsonT);
}
