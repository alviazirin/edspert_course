// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BannerItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

BannerItem _$BannerItemFromJson(Map<String, dynamic> json) => BannerItem(
      eventId: json['eventId'] as String?,
      eventTitle: json['eventTitle'] as String?,
      eventDescription: json['eventDescription'] as String?,
      eventImage: json['eventImage'] as String?,
      eventUrl: json['eventUrl'] as String?,
    );

Map<String, dynamic> _$BannerItemToJson(BannerItem instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'eventTitle': instance.eventTitle,
      'eventDescription': instance.eventDescription,
      'eventImage': instance.eventImage,
      'eventUrl': instance.eventUrl,
    };
