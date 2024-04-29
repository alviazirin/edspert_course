import 'package:json_annotation/json_annotation.dart';

part 'course_response_model.g.dart';

@JsonSerializable()
class CourseResponse {
  final int? status;
  final String? message;
  @JsonKey(name: "data")
  final List<CourseItem>? data;

  CourseResponse({
    this.status,
    this.message,
    this.data,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
  // factory CourseResponse.fromJson(Map<String, dynamic> json) => CourseResponse(
  //       status: json["status"],
  //       message: json["message"],
  //       data: json["data"] == null
  //           ? []
  //           : List<CourseItem>.from(
  //               json["data"]!.map((x) => CourseItem.fromJson(x))),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "data": data == null
  //           ? []
  //           : List<dynamic>.from(data!.map((x) => x.toJson())),
  //     };
}

@JsonSerializable()
class CourseItem {
  final String? courseId;
  final String? majorName;
  final String? courseCategory;
  final String? courseName;
  final String? urlCover;
  final int? jumlahMateri;
  final int? jumlahDone;
  final int? progress;

  CourseItem({
    this.courseId,
    this.majorName,
    this.courseCategory,
    this.courseName,
    this.urlCover,
    this.jumlahMateri,
    this.jumlahDone,
    this.progress,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) =>
      _$CourseItemFromJson(json);

  Map<String, dynamic> toJson() => _$CourseItemToJson(this);
}
