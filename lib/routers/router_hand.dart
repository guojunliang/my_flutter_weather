import 'package:fluro/fluro.dart';
import 'package:my_flutter_weather/views/app_home.dart';


var homeHandler = new Handler(handlerFunc: (context, params) {
  return AppHome();
});