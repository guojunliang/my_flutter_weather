class TimeUtil {
  String getWeatherDate(String date) {
    var replaceAll = date.replaceAll("-", "/");
    var substring = replaceAll.substring(replaceAll.indexOf("/") + 1);
    print("replaceAll:$replaceAll      subString:$substring");

    return substring;
  }
}