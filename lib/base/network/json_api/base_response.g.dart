// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      data: json['data'] == null
          ? null
          : Data<T>.fromJson(json['data'] as Map<String, dynamic>,
              (value) => fromJsonT(value)),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data?.toJson(
        (value) => toJsonT(value),
      ),
      'meta': instance.meta,
    };

BaseListResponse<T> _$BaseListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseListResponse<T>(
      meta: json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data<T>.fromJson(
              e as Map<String, dynamic>, (value) => fromJsonT(value)))
          .toList(),
    );

Map<String, dynamic> _$BaseListResponseToJson<T>(
  BaseListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data
          ?.map((e) => e.toJson(
                (value) => toJsonT(value),
              ))
          .toList(),
    };

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) => MetaResponse(
      totalRecordCount: json['totalRecordCount'] as int?,
      currentRecordCount: json['currentRecordCount'] as int?,
      totalPage: json['totalPage'] as int?,
      currentPage: json['currentPage'] as int?,
      perPage: json['perPage'] as int?,
      startOf: json['startOf'] as int?,
    );

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{
      'totalRecordCount': instance.totalRecordCount,
      'currentRecordCount': instance.currentRecordCount,
      'totalPage': instance.totalPage,
      'currentPage': instance.currentPage,
      'perPage': instance.perPage,
      'startOf': instance.startOf,
    };

Data<T> _$DataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Data<T>(
      id: json['id'] as String?,
      type: json['type'] as String,
      attributes: fromJsonT(json['attributes']),
    );

Map<String, dynamic> _$DataToJson<T>(
  Data<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': toJsonT(instance.attributes),
    };
