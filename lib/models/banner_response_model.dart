// To parse this JSON data, do
//
//     final bannerResponse = bannerResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'banner_response_model.g.dart';

@JsonSerializable()
class BannerResponse {
  final int? status;
  final String? message;
  @JsonKey(name: 'data')
  final List<BannerItem>? data;

  BannerResponse({
    this.status,
    this.message,
    this.data,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}

@JsonSerializable()
class BannerItem {
  final String? eventId;
  final String? eventTitle;
  final String? eventDescription;
  final String? eventImage;
  final String? eventUrl;

  BannerItem({
    this.eventId,
    this.eventTitle,
    this.eventDescription,
    this.eventImage,
    this.eventUrl,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
}
