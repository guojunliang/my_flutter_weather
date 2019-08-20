// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityBean _$CityBeanFromJson(Map<String, dynamic> json) {
  return CityBean(
    (json['result'] as List)
        ?.map(
            (e) => e == null ? null : City.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CityBeanToJson(CityBean instance) => <String, dynamic>{
      'result': instance.result,
    };

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    json['city'] as String,
    json['cityid'] as int,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'cityid': instance.cityid,
      'city': instance.city,
    };
