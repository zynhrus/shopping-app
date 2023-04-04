// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ApiErrorModelCWProxy {
  ApiErrorModel error(String error);

  ApiErrorModel message(String? message);

  ApiErrorModel statusCode(int? statusCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApiErrorModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApiErrorModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ApiErrorModel call({
    String? error,
    String? message,
    int? statusCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfApiErrorModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfApiErrorModel.copyWith.fieldName(...)`
class _$ApiErrorModelCWProxyImpl implements _$ApiErrorModelCWProxy {
  final ApiErrorModel _value;

  const _$ApiErrorModelCWProxyImpl(this._value);

  @override
  ApiErrorModel error(String error) => this(error: error);

  @override
  ApiErrorModel message(String? message) => this(message: message);

  @override
  ApiErrorModel statusCode(int? statusCode) => this(statusCode: statusCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApiErrorModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApiErrorModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ApiErrorModel call({
    Object? error = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? statusCode = const $CopyWithPlaceholder(),
  }) {
    return ApiErrorModel(
      error: error == const $CopyWithPlaceholder() || error == null
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as String,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      statusCode: statusCode == const $CopyWithPlaceholder()
          ? _value.statusCode
          // ignore: cast_nullable_to_non_nullable
          : statusCode as int?,
    );
  }
}

extension $ApiErrorModelCopyWith on ApiErrorModel {
  /// Returns a callable class that can be used as follows: `instanceOfApiErrorModel.copyWith(...)` or like so:`instanceOfApiErrorModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ApiErrorModelCWProxy get copyWith => _$ApiErrorModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      error: json['error'] as String,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
