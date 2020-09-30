import 'refer.dart';

abstract class WeatherAnswer {
  /// API状态码，具体含义请参考[状态码](https://dev.heweather.com/docs/start/status-code)
  final String code;

  /// 当前[API的最近更新时间](https://dev.heweather.com/docs/start/glossary#updatetime)
  final String updateTime;

  /// 该城市的天气预报和实况自适应网页，可嵌入网站或应用
  final String fxLink;
  final Refer refer;

  WeatherAnswer(this.code, this.updateTime, this.fxLink, this.refer);
}
