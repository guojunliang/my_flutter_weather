import 'package:fluro/fluro.dart';
import 'package:my_flutter_weather/routers/router_hand.dart';

class Routers {

  static final String pageHome = "/home";
  static final String pageCity = "/city";
  static final String pageWebView = "/webView";

  static void configRouter(Router router) {
    router.notFoundHandler = new Handler(handlerFunc: (context, params) {

    });
    router.define(pageHome, handler: homeHandler);
    router.define(pageCity, handler: cityHandler);
    router.define(pageWebView, handler: webViewHandler);
  }
}