import 'dart:convert';

import 'now_weather.dart';
import 'refer.dart';
import 'weather_answer.dart';

class NowWeatherAnswer extends WeatherAnswer {
  final NowWeather now;

  NowWeatherAnswer(
      String code, String updateTime, String fxLink, Refer refer, this.now)
      : super(code, updateTime, fxLink, refer);

  factory NowWeatherAnswer.fromJSON(String source) {
    final map = jsonDecode(source);
    return NowWeatherAnswer.fromKVPair(map);
  }

  factory NowWeatherAnswer.fromKVPair(Map<String, dynamic> source) {
    final code = source['code'];
    final updateTime = source['updateTime'];
    final fxLink = source['fxLink'];
    final refer = Refer.fromKVPair(source['refer']);
    final now = NowWeather.fromKVPair(source['now']);
    return NowWeatherAnswer(code, updateTime, fxLink, refer, now);
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
      'now': this.now.toKVPair(),
      'refer': this.refer.toKVPair(),
    };
  }
}
