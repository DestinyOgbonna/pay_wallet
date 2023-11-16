import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponse<T> {
  final T? data;
  final bool status;
  final bool? isVerified;
  final String? message;
  final int? statusCode;

  const BaseResponse({
    this.data,
    required this.status,
    this.message,
    this.statusCode,
    this.isVerified,
  });

  factory BaseResponse.fromMap(Map<String, dynamic> json) {
    return BaseResponse(
      data: null,
      status: false,
      message: json['message'] is List
          ? List.from(json['message']).join(',')
          : json['message'] ?? 'Something Went wrong',
      statusCode: json['statusCode'] ?? 0,
      isVerified: json['isVerified'],
    );
  }

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }
}
