import 'package:json_annotation/json_annotation.dart';
part 'user_by_email_response_model.g.dart';

@JsonSerializable()
class UserByEmailResponse {
  final int? status;
  final String? message;
  @JsonKey(name: "data")
  final UserEmail? data;

  UserByEmailResponse({
    this.status,
    this.message,
    this.data,
  });

  factory UserByEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$UserByEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserByEmailResponseToJson(this);
}

@JsonSerializable()
class UserEmail {
  final String? iduser;
  final String? userName;
  final String? userEmail;
  final String? userFoto;
  final String? userAsalSekolah;
  final DateTime? dateCreate;
  final String? jenjang;
  final String? userGender;
  final String? userStatus;
  final String? kelas;

  UserEmail({
    this.iduser,
    this.userName,
    this.userEmail,
    this.userFoto,
    this.userAsalSekolah,
    this.dateCreate,
    this.jenjang,
    this.userGender,
    this.userStatus,
    this.kelas,
  });

  factory UserEmail.fromJson(Map<String, dynamic> json) =>
      _$UserEmailFromJson(json);

  Map<String, dynamic> toJson() => _$UserEmailToJson(this);
}
