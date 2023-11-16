
import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  int? userID;
  int? id;
  String? title;
  PostModel({
    this.userID,
     this.id,
    this.title,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
