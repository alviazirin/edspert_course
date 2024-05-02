import 'package:json_annotation/json_annotation.dart';

part 'exercise_response_model.g.dart';

@JsonSerializable()
class ExerciseResponse {
  final int? status;
  final String? message;
  @JsonKey(name: "data")
  final List<ExerciseItem>? data;

  ExerciseResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ExerciseResponse.fromJson(Map<String, dynamic> json) =>
      _$ExerciseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseResponseToJson(this);
}

@JsonSerializable()
class ExerciseItem {
  final String? exerciseId;
  final String? exerciseTitle;
  final String? accessType;
  final String? icon;
  final String? exerciseUserStatus;
  final String? jumlahSoal;
  final int? jumlahDone;

  ExerciseItem({
    this.exerciseId,
    this.exerciseTitle,
    this.accessType,
    this.icon,
    this.exerciseUserStatus,
    this.jumlahSoal,
    this.jumlahDone,
  });

  factory ExerciseItem.fromJson(Map<String, dynamic> json) =>
      _$ExerciseItemFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseItemToJson(this);
}
