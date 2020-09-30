import 'dart:convert';

class NowWeather {
  /// 实况观测时间
  final String obsTime;

  /// 实况温度，默认单位：摄氏度
  final String temp;

  /// 实况体感温度，默认单位：摄氏度
  final String feelsLike;

  /// 当前天气状况和图标的代码，图标可通过[天气状况和图标](https://dev.heweather.com/docs/start/icons)下载
  final String icon;

  /// 实况天气状况的文字描述，包括阴晴雨雪等天气状态的描述
  final String text;

  /// 实况风向360角度
  final String wind360;

  /// 实况风向
  final String windDir;

  /// 实况风力等级
  final String windScale;

  /// 实况风速，公里/小时
  final String windSpeed;

  /// 实况相对湿度，百分比数值
  final String humidity;

  /// 实况降水量，默认单位：毫米
  final String precip;

  /// 实况大气压强，默认单位：百帕
  final String pressure;

  /// 实况能见度，默认单位：公里
  final String vis;

  /// 实况云量，百分比数值
  final String cloud;

  /// 实况露点温度
  final String dew;

  NowWeather(
      this.obsTime,
      this.temp,
      this.feelsLike,
      this.icon,
      this.text,
      this.wind360,
      this.windDir,
      this.windScale,
      this.windSpeed,
      this.humidity,
      this.precip,
      this.pressure,
      this.vis,
      this.cloud,
      this.dew);

  factory NowWeather.fromJSON(String source) {
    final map = jsonDecode(source);
    return NowWeather.fromKVPair(map);
  }

  factory NowWeather.fromKVPair(Map<String, dynamic> source) {
    final obsTime = source['obsTime'];
    final temp = source['temp'];
    final feelsLike = source['feelsLike'];
    final icon = source['icon'];
    final text = source['text'];
    final wind360 = source['wind360'];
    final windDir = source['windDir'];
    final windScale = source['windScale'];
    final windSpeed = source['windSpeed'];
    final humidity = source['humidity'];
    final precip = source['precip'];
    final pressure = source['pressure'];
    final vis = source['vis'];
    final cloud = source['cloud'];
    final dew = source['dew'];
    return NowWeather(obsTime, temp, feelsLike, icon, text, wind360, windDir,
        windScale, windSpeed, humidity, precip, pressure, vis, cloud, dew);
  }

  String toJSON() {
    final map = toKVPair();
    return jsonEncode(map);
  }

  Map<String, dynamic> toKVPair() {
    return <String, dynamic>{
      'obsTime': this.obsTime,
      'temp': this.temp,
      'feelsLike': this.feelsLike,
      'icon': this.icon,
      'text': this.text,
      'wind360': this.wind360,
      'windDir': this.windDir,
      'windScale': this.windScale,
      'windSpeed': this.windSpeed,
      'humidity': this.humidity,
      'precip': this.precip,
      'pressure': this.pressure,
      'vis': this.vis,
      'cloud': this.cloud,
      'dew': this.dew,
    };
  }
}
