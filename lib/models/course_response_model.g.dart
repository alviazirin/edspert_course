// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) =>
    CourseResponse(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CourseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseResponseToJson(CourseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CourseItem _$CourseItemFromJson(Map<String, dynamic> json) => CourseItem(
      courseId: json['courseId'] as String?,
      majorName: json['majorName'] as String?,
      courseCategory: json['courseCategory'] as String?,
      courseName: json['courseName'] as String?,
      urlCover: json['urlCover'] as String?,
      jumlahMateri: (json['jumlahMateri'] as num?)?.toInt(),
      jumlahDone: (json['jumlahDone'] as num?)?.toInt(),
      progress: (json['progress'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CourseItemToJson(CourseItem instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'majorName': instance.majorName,
      'courseCategory': instance.courseCategory,
      'courseName': instance.courseName,
      'urlCover': instance.urlCover,
      'jumlahMateri': instance.jumlahMateri,
      'jumlahDone': instance.jumlahDone,
      'progress': instance.progress,
    };
