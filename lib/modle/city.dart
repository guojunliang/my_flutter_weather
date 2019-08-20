import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class CityBean {
  List<City> result;

  CityBean(this.result);

  factory CityBean.formJson(Map<String,dynamic> json){
    return _$CityBeanFromJson(json);
  }
  Map<String,dynamic> toJson(){
    return _$CityBeanToJson(this);
  }
}

@JsonSerializable()
class City {
  final int cityid;
  final String city;

  City(this.city, this.cityid);

  factory City.fromJson(Map<String,dynamic> json){
    return _$CityFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$CityToJson(this);
  }
}