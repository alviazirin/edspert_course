// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_by_email_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserByEmailResponse _$UserByEmailResponseFromJson(Map<String, dynamic> json) =>
    UserByEmailResponse(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserEmail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserByEmailResponseToJson(
        UserByEmailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserEmail _$UserEmailFromJson(Map<String, dynamic> json) => UserEmail(
      iduser: json['iduser'] as String?,
      userName: json['userName'] as String?,
      userEmail: json['userEmail'] as String?,
      userFoto: json['userFoto'] as String?,
      userAsalSekolah: json['userAsalSekolah'] as String?,
      dateCreate: json['dateCreate'] == null
          ? null
          : DateTime.parse(json['dateCreate'] as String),
      jenjang: json['jenjang'] as String?,
      userGender: json['userGender'] as String?,
      userStatus: json['userStatus'] as String?,
      kelas: json['kelas'] as String?,
    );

Map<String, dynamic> _$UserEmailToJson(UserEmail instance) => <String, dynamic>{
      'iduser': instance.iduser,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'userFoto': instance.userFoto,
      'userAsalSekolah': instance.userAsalSekolah,
      'dateCreate': instance.dateCreate?.toIso8601String(),
      'jenjang': instance.jenjang,
      'userGender': instance.userGender,
      'userStatus': instance.userStatus,
      'kelas': instance.kelas,
    };
