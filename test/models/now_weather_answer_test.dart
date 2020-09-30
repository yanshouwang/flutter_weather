import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/models/now_weather.dart';
import 'package:flutter_weather/models/now_weather_answer.dart';
import 'package:flutter_weather/models/refer.dart';

void main() {
  test('反序列化', () {
    final source =
        '{"code":"200","updateTime":"2020-09-29T08:26+08:00","fxLink":"http://hfx.link/2ax1","now":{"obsTime":"2020-09-29T08:05+08:00","temp":"14","feelsLike":"11","icon":"305","text":"小雨","wind360":"3","windDir":"北风","windScale":"4","windSpeed":"20","humidity":"86","precip":"1.4","pressure":"1014","vis":"16","cloud":"95","dew":"13"},"refer":{"sources":["Weather China"],"license":["no commercial use"]}}';
    NowWeatherAnswer actual = NowWeatherAnswer.fromJSON(source);
    final matcher = '200';
    expect(actual.code, matcher);
  });

  test('序列化', () {
    final sources = ['Weather China'];
    final license = ['no commercial use'];
    final refer = Refer(sources, license);
    final now = NowWeather('2020-09-29T08:05+08:00', '14', '11', '305', '小雨',
        '3', '北风', '4', '20', '86', '1.4', '1014', '16', '95', '13');
    final answer = NowWeatherAnswer(
        '200', '2020-09-29T08:26+08:00', 'http://hfx.link/2ax1', refer, now);
    final actual = answer.toJSON();
    final matcher =
        '{"code":"200","updateTime":"2020-09-29T08:26+08:00","fxLink":"http://hfx.link/2ax1","now":{"obsTime":"2020-09-29T08:05+08:00","temp":"14","feelsLike":"11","icon":"305","text":"小雨","wind360":"3","windDir":"北风","windScale":"4","windSpeed":"20","humidity":"86","precip":"1.4","pressure":"1014","vis":"16","cloud":"95","dew":"13"},"refer":{"sources":["Weather China"],"license":["no commercial use"]}}';
    expect(actual, matcher);
  });
}
