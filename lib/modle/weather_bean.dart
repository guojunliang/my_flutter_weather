import 'package:json_annotation/json_annotation.dart';

part 'weather_bean.g.dart';
//flutter packages pub run build_runner build
@JsonSerializable()
class WeatherBean {
  int status;
  String msg;
  WeatherResult result;

  WeatherBean({this.status, this.msg, this.result});

  factory WeatherBean.fromJson(Map<String, dynamic> json){
    return _$WeatherBeanFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeatherBeanToJson(this);
  }

  @override
  String toString() {
    return 'WeatherBean{status: $status, msg: $msg, result: $result}';
  }
}

@JsonSerializable()
class WeatherResult {
  final String city; //城市
  final String citycode; //城市code (int)
  final String date; //日期
  final String week; //星期
  final String weather; //天气
  final String temp; //当前气温
  final String temphigh; //最高温度
  final String templow; //最低温度
  final String img; //图片
  final String humidity; //湿度
  final String pressure; //气压
  final String windspeed; //风速
  final String winddirect; //风向
  final String windpower; //风级
  final String updatetime; //更新时间
  final Aqi aqi;
  final List<WeatherIndex> indexs; //生活指数
  final List<WeatherDaily> dailys; //一周天气
  final List<WeatherHourly> hours;

  WeatherResult({this.city, this.citycode, this.date, this.week, this.weather,
    this.temp, this.temphigh, this.templow, this.img, this.humidity,
    this.pressure, this.windspeed, this.winddirect, this.windpower,
    this.updatetime, this.aqi, this.indexs, this.dailys, this.hours}); //24小时天气

  factory WeatherResult.fromJson(Map<String, dynamic> json){
    return _$WeatherResultFromJson(json);
  }

  @override
  String toString() {
    return 'WeatherResult{city: $city, citycode: $citycode, date: $date, week: $week, weather: $weather, temp: $temp, temphigh: $temphigh, templow: $templow, img: $img, humidity: $humidity, pressure: $pressure, windspeed: $windspeed, winddirect: $winddirect, windpower: $windpower, updatetime: $updatetime, aqi: $aqi, indexs: $indexs, dailys: $dailys, hours: $hours}';
  }

}

@JsonSerializable()
class WeatherIndex {
  final String iname; //指数名
  final String ivalue; //指数值
  final String detail;

  WeatherIndex({
    this.iname, this.ivalue, this.detail
  }); //指数描述

  factory WeatherIndex.fromJson(Map<String, dynamic> json){
    return _$WeatherIndexFromJson(json);
  }
}

//每天天气
@JsonSerializable()
class WeatherDaily {
  final String date; //日期
  final String week; //星期
  final String sunrise; //日出
  final String sunset; //日落
  final DayNight night; //夜间天气
  final DayNight day;

  WeatherDaily({
    this.date, this.week, this.sunrise, this.sunset, this.night,
    this.day
  }); //白天天气
  factory WeatherDaily.fromJson(Map<String, dynamic> json){
    return _$WeatherDailyFromJson(json);
  }
}

//白天夜间天气
@JsonSerializable()
class DayNight {
  final String weather; //天气
  final String temphigh; //白天最高温度
  final String templow; //夜间最低温度
  final String img;
  final String winddirect; //风速
  final String windpower;

  DayNight({
    this.weather, this.temphigh, this.templow, this.img, this.winddirect,
    this.windpower
  }); //风力
  factory DayNight.fromJson(Map<String, dynamic> json){
    return _$DayNightFromJson(json);
  }
}


//小时的天气
@JsonSerializable()
class WeatherHourly {
  final String time; //时间
  final String weather; //天气
  final String temp; //温度
  final String img;

  WeatherHourly({
    this.time, this.weather, this.temp, this.img
  });

  factory WeatherHourly.fromJson(Map<String, dynamic> json){
    return _$WeatherHourlyFromJson(json);
  }
}

//AQI 指数
@JsonSerializable()
class Aqi {
  final String aqi;
  final String quality;
  final AqiInfo aqiinfo;

  Aqi({
    this.aqi, this.quality, this.aqiinfo
  });

  factory Aqi.fromJson(Map<String, dynamic> json){
    return _$AqiFromJson(json);
  }
}

//AQI描述
@JsonSerializable()
class AqiInfo {
  final String level;
  final String color;
  final String affect;
  final String measure;

  AqiInfo({
    this.level, this.color, this.affect, this.measure
  });

  factory AqiInfo.fromJson(Map<String, dynamic> json){
    return _$AqiInfoFromJson(json);
  }
}