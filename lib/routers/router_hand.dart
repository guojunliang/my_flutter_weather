import 'package:fluro/fluro.dart';
import 'package:my_flutter_weather/views/app_home.dart';
import 'package:my_flutter_weather/views/city_page.dart';
import 'package:my_flutter_weather/views/webview_page.dart';


var homeHandler = new Handler(handlerFunc: (context, params) {
  return AppHome();
});

var cityHandler = new Handler(handlerFunc: (context, params) {
//  return CityPage();
  return CityPage();
});

var webViewHandler = new Handler(handlerFunc: (context, params) {
  String title = params["title"]?.first;
  String url = params["url"]?.first;
  print("webview title:$title   url:$url");
  return WebViewPage(title, url);
});