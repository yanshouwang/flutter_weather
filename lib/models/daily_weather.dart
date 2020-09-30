import 'dart:convert';

class DailyWeather {
  /// 预报日期
  final String fxDate;

  /// 日出时间
  final String sunrise;

  /// 日落时间
  final String sunset;

  /// 月升时间
  final String moonrise;

  /// 月落时间
  final String moonset;

  /// 月相名称
  final String moonPhase;

  /// 预报当天最高温度
  final String tempMax;

  /// 预报当天最低温度
  final String tempMin;

  /// 预报白天天气状况的图标代码，图标可通过[天气状况和图标](https://dev.heweather.com/docs/start/icons)下载
  final String iconDay;

  /// 预报白天天气状况文字描述，包括阴晴雨雪等天气状态的描述
  final String textDay;

  /// 预报夜间天气状况的图标代码，图标可通过[天气状况和图标](https://dev.heweather.com/docs/start/icons)下载
  final String iconNight;

  /// 预报晚间天气状况文字描述，包括阴晴雨雪等天气状态的描述
  final String textNight;

  /// 预报白天风向360角度
  final String wind360Day;

  /// 预报白天风向
  final String windDirDay;

  /// 预报白天风力等级
  final String windScaleDay;

  /// 预报白天风速，公里/小时
  final String windSpeedDay;

  /// 预报夜间风向360角度
  final String wind360Night;

  /// 预报夜间当天风向
  final String windDirNight;

  /// 预报夜间风力等级
  final String windScaleNight;

  /// 预报夜间风速，公里/小时
  final String windSpeedNight;

  /// 预报当天相对湿度，百分比数值
  final String humidity;

  /// 预报当天降水量，默认单位：毫米
  final String precip;

  /// 预报当天大气压强，默认单位：百帕
  final String pressure;

  /// 预报当天能见度，默认单位：公里
  final String vis;

  /// 预报当天云量，百分比数值
  final String cloud;

  /// 预报当天紫外线强度指数
  final String uvIndex;

  DailyWeather(
      this.fxDate,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.tempMax,
      this.tempMin,
      this.iconDay,
      this.textDay,
      this.iconNight,
      this.textNight,
      this.wind360Day,
      this.windDirDay,
      this.windScaleDay,
      this.windSpeedDay,
      this.wind360Night,
      this.windDirNight,
      this.windScaleNight,
      this.windSpeedNight,
      this.humidity,
      this.precip,
      this.pressure,
      this.vis,
      this.cloud,
      this.uvIndex);

  factory DailyWeather.fromJSON(String source) {
    final map = jsonDecode(source);
    return DailyWeather.fromKVPair(map);
  }

  factory DailyWeather.fromKVPair(Map<String, dynamic> source) {
    final fxDate = source['fxDate'];
    final sunrise = source['sunrise'];
    final sunset = source['sunset'];
    final moonrise = source['moonrise'];
    final moonset = source['moonset'];
    final moonPhase = source['moonPhase'];
    final tempMax = source['tempMax'];
    final tempMin = source['tempMin'];
    final iconDay = source['iconDay'];
    final textDay = source['textDay'];
    final iconNight = source['iconNight'];
    final textNight = source['textNight'];
    final wind360Day = source['wind360Day'];
    final windDirDay = source['windDirDay'];
    final windScaleDay = source['windScaleDay'];
    final windSpeedDay = source['windSpeedDay'];
    final wind360Night = source['wind360Night'];
    final windDirNight = source['windDirNight'];
    final windScaleNight = source['windScaleNight'];
    final windSpeedNight = source['windSpeedNight'];
    final humidity = source['humidity'];
    final precip = source['precip'];
    final pressure = source['pressure'];
    final vis = source['vis'];
    final cloud = source['cloud'];
    final uvIndex = source['uvIndex'];
    return DailyWeather(
        fxDate,
        sunrise,
        sunset,
        moonrise,
        moonset,
        moonPhase,
        tempMax,
        tempMin,
        iconDay,
        textDay,
        iconNight,
        textNight,
        wind360Day,
        windDirDay,
        windScaleDay,
        windSpeedDay,
        wind360Night,
        windDirNight,
        windScaleNight,
        windSpeedNight,
        humidity,
        precip,
        pressure,
        vis,
        cloud,
        uvIndex);
  }

  String toJSON() {
    final map = toKVPair();
    return jsonEncode(map);
  }

  Map<String, dynamic> toKVPair() {
    return <String, dynamic>{
      'fxDate': this.fxDate,
      'sunrise': this.sunrise,
      'sunset': this.sunset,
      'moonrise': this.moonrise,
      'moonset': this.moonset,
      'moonPhase': this.moonPhase,
      'tempMax': this.tempMax,
      'tempMin': this.tempMin,
      'iconDay': this.iconDay,
      'textDay': this.textDay,
      'iconNight': this.iconNight,
      'textNight': this.textNight,
      'wind360Day': this.wind360Day,
      'windDirDay': this.windDirDay,
      'windScaleDay': this.windScaleDay,
      'windSpeedDay': this.windSpeedDay,
      'wind360Night': this.wind360Night,
      'windDirNight': this.windDirNight,
      'windScaleNight': this.windScaleNight,
      'windSpeedNight': this.windSpeedNight,
      'humidity': this.humidity,
      'precip': this.precip,
      'pressure': this.pressure,
      'vis': this.vis,
      'cloud': this.cloud,
      'uvIndex': this.uvIndex,
    };
  }
}
