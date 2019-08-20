import 'package:my_flutter_weather/modle/weather_bean.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_weather/util/time_util.dart';

class WeatherDayView extends StatelessWidget {
  List<ui.Image> dayImages;
  List<ui.Image> nightImages;
  List<WeatherDaily> dailys;
  double itemWidth = 70;
  double itemHeight = 320;


  WeatherDayView(this.dailys, this.dayImages, this.nightImages);

  @override
  Widget build(BuildContext context) {
    double widghtWidth = itemWidth * dailys.length.toDouble();
    return CustomPaint(
      painter: _customPainter(dailys, dayImages, nightImages),
      size: Size(widghtWidth, itemHeight),);
  }
}

class _customPainter extends CustomPainter {
  List<ui.Image> dayImages;
  List<ui.Image> nightImages;
  List<WeatherDaily> dailys;
  double itemWidth = 70;
  double itemHeight = 320;
  final double temHeight = 80; //温度区域的高度
  int maxTem, minTem; //最高/低温度

  _customPainter(this.dailys, this.dayImages, this.nightImages);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setMinMax();
    //画竖直线
    drawLine(canvas);
    //画日期
    drawDate(canvas);
    //画白天天气图片
    drawDayImage(canvas, dayImages, 50);
    //画白天天气
    drawDayWeather(canvas, dailys);
    //画白天温度折线
    drawDayTempLine(canvas, dailys);
    //画晚上天气图片
    drawDayImage(canvas, nightImages, (120 + temHeight + 10));
    //画晚上天气
    drawNightWeather(canvas, dailys);
    //画风向
    drawWind(canvas, dailys);

  }

  void drawLine(ui.Canvas canvas) {
    Paint linePaint = Paint();
    linePaint
      ..color = Colors.white60
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < 20; i++) {
      Offset p1 = Offset((i + 1) * itemWidth, 0);
      Offset p2 = Offset((i + 1) * itemWidth, itemHeight);
      canvas.drawLine(p1, p2, linePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawDate(ui.Canvas canvas) {
    for (int i = 0; i < dailys.length; i++) {
      String str = "";
      if (i == 0) {
        str = "${dailys[i].week}\n今天";
      } else if (i == 1) {
        str = "${dailys[i].week}\n明天";
      } else {
        var daily = dailys[i];
        var date = TimeUtil().getWeatherDate(daily.date);
        str = "${dailys[i].week}\n$date";
      }
      ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
          ui.ParagraphStyle(textAlign: TextAlign.center));
      paragraphBuilder.addText(str);
      paragraphBuilder.pushStyle(ui.TextStyle(color: Colors.white,));
      var paragraph = paragraphBuilder.build();
      paragraph.layout(ui.ParagraphConstraints(width: itemWidth));
      canvas.drawParagraph(paragraph, Offset(i * itemWidth, 10));
    }
  }

  void drawDayImage(Canvas canvas, List<ui.Image> dayImages, double offHeight) {
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..isAntiAlias = true;
    for (int i = 0; i < dayImages.length; i++) {
      var dayImage = dayImages[i];
      var rect = Rect.fromLTWH(
          itemWidth / 4 + i * itemWidth, offHeight, 30, 30);
      canvas.drawImageRect(dayImage, new Rect.fromLTWH(
          0, 0, dayImage.width.toDouble(), dayImage.height.toDouble()), rect,
          paint);
    }
  }

  void drawDayWeather(ui.Canvas canvas, List<WeatherDaily> dailys) {
    for (int i = 0; i < dailys.length; i++) {
      var daily = dailys[i];
      ui.ParagraphBuilder builder = new ui.ParagraphBuilder(
          ui.ParagraphStyle(textAlign: TextAlign.center));
      builder.pushStyle(ui.TextStyle(color: Colors.white, fontSize: 16));
      builder.addText(daily.day.weather);
      var paragraph = builder.build()
        ..layout(ui.ParagraphConstraints(width: itemWidth));

      canvas.drawParagraph(paragraph, Offset(i * itemWidth, 90));
    }
  }

//画晚上天气
  void drawNightWeather(ui.Canvas canvas, List<WeatherDaily> dailys) {
    for (int i = 0; i < dailys.length; i++) {
      var daily = dailys[i];
      ui.ParagraphBuilder builder = new ui.ParagraphBuilder(
          ui.ParagraphStyle(textAlign: TextAlign.center));
      builder.pushStyle(ui.TextStyle(color: Colors.white, fontSize: 16));
      builder.addText(daily.night.weather);
      var paragraph = builder.build()
        ..layout(ui.ParagraphConstraints(width: itemWidth));

      canvas.drawParagraph(paragraph, Offset(i * itemWidth, 250));
    }
  }

  //设置最高温度，最低温度
  setMinMax() {
    minTem = maxTem = int.parse(dailys[0].day.temphigh);
    for (WeatherDaily daily in dailys) {
      if (int.parse(daily.day.temphigh) > maxTem) {
        maxTem = int.parse(daily.day.temphigh);
      }
      if (int.parse(daily.night.templow) < minTem) {
        minTem = int.parse(daily.night.templow);
      }
    }
  }


  void drawDayTempLine(ui.Canvas canvas, List<WeatherDaily> dailys) {
    Paint pointPaint = new Paint();
    pointPaint
      ..color = Colors.green
      ..style = ui.PaintingStyle.fill
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;
    Paint daylinePaint = new Paint();
    daylinePaint
      ..color = Colors.yellow
      ..style = ui.PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    Paint nightlinePaint = new Paint();
    nightlinePaint
      ..color = Colors.blue
      ..style = ui.PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    double tempHeight = temHeight / (maxTem - minTem);
    Path dayPath = Path();
    Path nightPath = Path();
    int offHeight = 120;
    List<Offset> dayPoint = [];
    List<Offset> nightPoint = [];
    for (int i = 0; i < dailys.length; i++) {
      var daily = dailys[i];
      double dy = (maxTem - int.parse(daily.day.temphigh)) * tempHeight +
          offHeight;
      print("dy:$dy");
      ui.Offset daySet = Offset(i * itemWidth + itemWidth / 2, dy);
      ui.Offset nightSet = Offset(i * itemWidth + itemWidth / 2,
          (maxTem - int.parse(daily.night.templow)) * tempHeight + offHeight);
      dayPoint.add(daySet);
      nightPoint.add(nightSet);
      if (i == 0) {
        dayPath.moveTo(daySet.dx, daySet.dy);
        nightPath.moveTo(nightSet.dx, nightSet.dy);
      } else {
        dayPath.lineTo(daySet.dx, daySet.dy);
        nightPath.lineTo(nightSet.dx, nightSet.dy);
      }
    }
    canvas.drawPath(dayPath, daylinePaint);
    canvas.drawPath(nightPath, nightlinePaint);
    canvas.drawPoints(ui.PointMode.points, dayPoint, pointPaint);
    canvas.drawPoints(ui.PointMode.points, nightPoint, pointPaint);
  }

  void drawWind(ui.Canvas canvas, List<WeatherDaily> dailys) {
    for (int i = 0; i < dailys.length; i++) {
      var daily = dailys[i];
      ui.ParagraphBuilder builder = ui.ParagraphBuilder(
          ui.ParagraphStyle(textAlign: TextAlign.center));
      builder.addText("${daily.night.windpower}\n${daily.day.windpower}");
      builder.pushStyle(ui.TextStyle(color: Colors.white, fontSize: 12));
      var paragraph = builder.build()
        ..layout(ui.ParagraphConstraints(width: itemWidth));
      canvas.drawParagraph(paragraph, ui.Offset(i * itemWidth, 280));
    }
  }
}