// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'astro.g.dart';

@JsonSerializable()
class AstroData {
  String sunrise;
  String sunset;
  String solar_noon;
  int day_length;
  String civil_twilight_begin;
  String civil_twilight_end;
  String nautical_twilight_begin;
  String nautical_twilight_end;
  String astronomical_twilight_begin;
  String astronomical_twilight_end;

  AstroData({
    required this.sunrise,
    required this.sunset,
    required this.solar_noon,
    required this.day_length,
    required this.civil_twilight_begin,
    required this.civil_twilight_end,
    required this.nautical_twilight_begin,
    required this.nautical_twilight_end,
    required this.astronomical_twilight_begin,
    required this.astronomical_twilight_end,
  });

  factory AstroData.fromJson(Map<String, dynamic> json) => _$AstroDataFromJson(json);
  Map<String, dynamic> toJson() => _$AstroDataToJson(this);
}

@JsonSerializable()
class AstroDataContainer {
  AstroData results;
  String status;
  String tzId;

  AstroDataContainer({
    required this.results,
    required this.status,
    required this.tzId,
  });

  factory AstroDataContainer.fromJson(Map<String, dynamic> json) => _$AstroDataContainerFromJson(json);
  Map<String, dynamic> toJson() => _$AstroDataContainerToJson(this);
}
