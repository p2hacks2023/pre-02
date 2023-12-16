// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AstroData _$AstroDataFromJson(Map<String, dynamic> json) => AstroData(
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      solar_noon: json['solar_noon'] as String,
      day_length: json['day_length'] as int,
      civil_twilight_begin: json['civil_twilight_begin'] as String,
      civil_twilight_end: json['civil_twilight_end'] as String,
      nautical_twilight_begin: json['nautical_twilight_begin'] as String,
      nautical_twilight_end: json['nautical_twilight_end'] as String,
      astronomical_twilight_begin:
          json['astronomical_twilight_begin'] as String,
      astronomical_twilight_end: json['astronomical_twilight_end'] as String,
    );

Map<String, dynamic> _$AstroDataToJson(AstroData instance) => <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'solar_noon': instance.solar_noon,
      'day_length': instance.day_length,
      'civil_twilight_begin': instance.civil_twilight_begin,
      'civil_twilight_end': instance.civil_twilight_end,
      'nautical_twilight_begin': instance.nautical_twilight_begin,
      'nautical_twilight_end': instance.nautical_twilight_end,
      'astronomical_twilight_begin': instance.astronomical_twilight_begin,
      'astronomical_twilight_end': instance.astronomical_twilight_end,
    };

AstroDataContainer _$AstroDataContainerFromJson(Map<String, dynamic> json) =>
    AstroDataContainer(
      results: AstroData.fromJson(json['results'] as Map<String, dynamic>),
      status: json['status'] as String,
      tzId: json['tzId'] as String,
    );

Map<String, dynamic> _$AstroDataContainerToJson(AstroDataContainer instance) =>
    <String, dynamic>{
      'results': instance.results,
      'status': instance.status,
      'tzId': instance.tzId,
    };
