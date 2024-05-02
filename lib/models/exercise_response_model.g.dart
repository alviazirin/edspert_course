// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseResponse _$ExerciseResponseFromJson(Map<String, dynamic> json) =>
    ExerciseResponse(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ExerciseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExerciseResponseToJson(ExerciseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ExerciseItem _$ExerciseItemFromJson(Map<String, dynamic> json) => ExerciseItem(
      exerciseId: json['exerciseId'] as String?,
      exerciseTitle: json['exerciseTitle'] as String?,
      accessType: json['accessType'] as String?,
      icon: json['icon'] as String?,
      exerciseUserStatus: json['exerciseUserStatus'] as String?,
      jumlahSoal: json['jumlahSoal'] as String?,
      jumlahDone: (json['jumlahDone'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExerciseItemToJson(ExerciseItem instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'exerciseTitle': instance.exerciseTitle,
      'accessType': instance.accessType,
      'icon': instance.icon,
      'exerciseUserStatus': instance.exerciseUserStatus,
      'jumlahSoal': instance.jumlahSoal,
      'jumlahDone': instance.jumlahDone,
    };
