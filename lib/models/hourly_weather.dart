class HourlyWeather {
  /// 逐小时预报时间
  final String fxTime;

  /// 逐小时预报温度
  final String temp;

  /// 逐小时预报天气状况图标代码，图标可通过[天气状况和图标](https://dev.heweather.com/docs/start/icons)下载
  final String icon;

  /// 逐小时预报天气状况文字描述，包括阴晴雨雪等天气状态的描述
  final String text;

  /// 逐小时预报风向360角度
  final String wind360;

  /// 逐小时预报风向
  final String windDir;

  /// 逐小时预报风力等级
  final String windScale;

  /// 逐小时预报风速，公里/小时
  final String windSpeed;

  /// 逐小时预报相对湿度，百分比数值
  final String humidity;

  /// 逐小时预报降水量，默认单位：毫米
  final String precip;

  /// 逐小时预报降水概率，百分比数值，可能为空
  final String pop;

  /// 逐小时预报大气压强，默认单位：百帕
  final String pressure;

  /// 逐小时预报云量，百分比数值
  final String cloud;

  /// 逐小时预报露点温度
  final String dew;

  HourlyWeather(
      this.fxTime,
      this.temp,
      this.icon,
      this.text,
      this.wind360,
      this.windDir,
      this.windScale,
      this.windSpeed,
      this.humidity,
      this.precip,
      this.pop,
      this.pressure,
      this.cloud,
      this.dew);
}
