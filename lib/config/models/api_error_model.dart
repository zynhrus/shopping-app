import 'package:fit_hub_project/main.library.dart';

part 'api_error_model.g.dart';

@CopyWith()
@JsonSerializable()
class ApiErrorModel extends Equatable implements Exception {
  final String error;
  final String? message;
  final int? statusCode;

  const ApiErrorModel({required this.error, this.message, this.statusCode});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  @override
  List<Object> get props => [error];

  @override
  String toString() =>
      'ApiErrorModel { Error Code: $error, Status Code: $statusCode,  Message: $message}';
}
