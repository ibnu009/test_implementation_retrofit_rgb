// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };

ErrorItem _$ErrorItemFromJson(Map<String, dynamic> json) => ErrorItem(
      status: json['status'] as String?,
      detail: json['detail'] as String?,
    )
      ..code = json['code'] as String?
      ..meta = json['meta'];

Map<String, dynamic> _$ErrorItemToJson(ErrorItem instance) => <String, dynamic>{
      'status': instance.status,
      'detail': instance.detail,
      'code': instance.code,
      'meta': instance.meta,
    };
