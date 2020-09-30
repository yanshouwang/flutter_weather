import 'dart:convert';

import 'daily_weather.dart';
import 'refer.dart';
import 'weather_answer.dart';

class DailyWeatherAnswer extends WeatherAnswer {
  final List<DailyWeather> daily;

  DailyWeatherAnswer(
      String code, String updateTime, String fxLink, Refer refer, this.daily)
      : super(code, updateTime, fxLink, refer);

  factory DailyWeatherAnswer.fromJSON(String source) {
    final map = jsonDecode(source);
    return DailyWeatherAnswer.fromKVPair(map);
  }

  factory DailyWeatherAnswer.fromKVPair(Map<String, dynamic> source) {
    final code = source['code'];
    final updateTime = source['updateTime'];
    final fxLink = source['fxLink'];
    final refer = Refer.fromKVPair(source['refer']);
    final daily = source['daily']
        .map((e) => DailyWeather.fromKVPair(e))
        .cast<DailyWeather>()
        .toList();
    return DailyWeatherAnswer(code, updateTime, fxLink, refer, daily);
  }

  String toJSON() {
    final map = toKVPair();
    return jsonEncode(map);
  }

  Map<String, dynamic> toKVPair() {
    return <String, dynamic>{
      'code': this.code,
      'updateTime': this.updateTime,
      'fxLink': this.fxLink,
      'daily': this.daily.map((e) => e.toKVPair()).toList(),
      'refer': this.refer.toKVPair(),
    };
  }
}
