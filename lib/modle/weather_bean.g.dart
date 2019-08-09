// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherBean _$WeatherBeanFromJson(Map<String, dynamic> json) {
  return WeatherBean(
    status: json['status'] as int,
    msg: json['msg'] as String,
    result: json['result'] == null
        ? null
        : WeatherResult.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherBeanToJson(WeatherBean instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'result': instance.result,
    };

WeatherResult _$WeatherResultFromJson(Map<String, dynamic> json) {
  return WeatherResult(
    city: json['city'] as String,
    citycode: json['citycode'] as String,
    date: json['date'] as String,
    week: json['week'] as String,
    weather: json['weather'] as String,
    temp: json['temp'] as String,
    temphigh: json['temphigh'] as String,
    templow: json['templow'] as String,
    img: json['img'] as String,
    humidity: json['humidity'] as String,
    pressure: json['pressure'] as String,
    windspeed: json['windspeed'] as String,
    winddirect: json['winddirect'] as String,
    windpower: json['windpower'] as String,
    updatetime: json['updatetime'] as String,
    aqi: json['aqi'] == null
        ? null
        : Aqi.fromJson(json['aqi'] as Map<String, dynamic>),
    indexs: (json['indexs'] as List)
        ?.map((e) =>
            e == null ? null : WeatherIndex.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dailys: (json['dailys'] as List)
        ?.map((e) =>
            e == null ? null : WeatherDaily.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hours: (json['hours'] as List)
        ?.map((e) => e == null
            ? null
            : WeatherHourly.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeatherResultToJson(WeatherResult instance) =>
    <String, dynamic>{
      'city': instance.city,
      'citycode': instance.citycode,
      'date': instance.date,
      'week': instance.week,
      'weather': instance.weather,
      'temp': instance.temp,
      'temphigh': instance.temphigh,
      'templow': instance.templow,
      'img': instance.img,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'windspeed': instance.windspeed,
      'winddirect': instance.winddirect,
      'windpower': instance.windpower,
      'updatetime': instance.updatetime,
      'aqi': instance.aqi,
      'indexs': instance.indexs,
      'dailys': instance.dailys,
      'hours': instance.hours,
    };

WeatherIndex _$WeatherIndexFromJson(Map<String, dynamic> json) {
  return WeatherIndex(
    iname: json['iname'] as String,
    ivalue: json['ivalue'] as String,
    detail: json['detail'] as String,
  );
}

Map<String, dynamic> _$WeatherIndexToJson(WeatherIndex instance) =>
    <String, dynamic>{
      'iname': instance.iname,
      'ivalue': instance.ivalue,
      'detail': instance.detail,
    };

WeatherDaily _$WeatherDailyFromJson(Map<String, dynamic> json) {
  return WeatherDaily(
    date: json['date'] as String,
    week: json['week'] as String,
    sunrise: json['sunrise'] as String,
    sunset: json['sunset'] as String,
    night: json['night'] == null
        ? null
        : DayNight.fromJson(json['night'] as Map<String, dynamic>),
    day: json['day'] == null
        ? null
        : DayNight.fromJson(json['day'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherDailyToJson(WeatherDaily instance) =>
    <String, dynamic>{
      'date': instance.date,
      'week': instance.week,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'night': instance.night,
      'day': instance.day,
    };

DayNight _$DayNightFromJson(Map<String, dynamic> json) {
  return DayNight(
    weather: json['weather'] as String,
    temphigh: json['temphigh'] as String,
    templow: json['templow'] as String,
    img: json['img'] as String,
    winddirect: json['winddirect'] as String,
    windpower: json['windpower'] as String,
  );
}

Map<String, dynamic> _$DayNightToJson(DayNight instance) => <String, dynamic>{
      'weather': instance.weather,
      'temphigh': instance.temphigh,
      'templow': instance.templow,
      'img': instance.img,
      'winddirect': instance.winddirect,
      'windpower': instance.windpower,
    };

WeatherHourly _$WeatherHourlyFromJson(Map<String, dynamic> json) {
  return WeatherHourly(
    time: json['time'] as String,
    weather: json['weather'] as String,
    temp: json['temp'] as String,
    img: json['img'] as String,
  );
}

Map<String, dynamic> _$WeatherHourlyToJson(WeatherHourly instance) =>
    <String, dynamic>{
      'time': instance.time,
      'weather': instance.weather,
      'temp': instance.temp,
      'img': instance.img,
    };

Aqi _$AqiFromJson(Map<String, dynamic> json) {
  return Aqi(
    aqi: json['aqi'] as String,
    quality: json['quality'] as String,
    aqiinfo: json['aqiinfo'] == null
        ? null
        : AqiInfo.fromJson(json['aqiinfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AqiToJson(Aqi instance) => <String, dynamic>{
      'aqi': instance.aqi,
      'quality': instance.quality,
      'aqiinfo': instance.aqiinfo,
    };

AqiInfo _$AqiInfoFromJson(Map<String, dynamic> json) {
  return AqiInfo(
    level: json['level'] as String,
    color: json['color'] as String,
    affect: json['affect'] as String,
    measure: json['measure'] as String,
  );
}

Map<String, dynamic> _$AqiInfoToJson(AqiInfo instance) => <String, dynamic>{
      'level': instance.level,
      'color': instance.color,
      'affect': instance.affect,
      'measure': instance.measure,
    };
