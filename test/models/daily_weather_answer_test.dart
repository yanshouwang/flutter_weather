import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/models/daily_weather.dart';
import 'package:flutter_weather/models/daily_weather_answer.dart';
import 'package:flutter_weather/models/refer.dart';

main() {
  test('反序列化', () {
    final source =
        '{"code":"200","updateTime":"2020-09-29T12:35+08:00","fxLink":"http://hfx.link/2ax1","daily":[{"fxDate":"2020-09-29","sunrise":"06:10","sunset":"17:57","moonrise":"17:14","moonset":"03:11","moonPhase":"盈凸月","tempMax":"18","tempMin":"9","iconDay":"305","textDay":"小雨","iconNight":"150","textNight":"晴","wind360Day":"45","windDirDay":"东北风","windScaleDay":"1-2","windSpeedDay":"3","wind360Night":"315","windDirNight":"西北风","windScaleNight":"1-2","windSpeedNight":"3","humidity":"71","precip":"6.3","pressure":"1011","vis":"24","cloud":"85","uvIndex":"1"},{"fxDate":"2020-09-30","sunrise":"06:11","sunset":"17:55","moonrise":"17:40","moonset":"04:12","moonPhase":"盈凸月","tempMax":"21","tempMin":"13","iconDay":"101","textDay":"多云","iconNight":"305","textNight":"小雨","wind360Day":"180","windDirDay":"南风","windScaleDay":"1-2","windSpeedDay":"3","wind360Night":"180","windDirNight":"南风","windScaleNight":"1-2","windSpeedNight":"3","humidity":"55","precip":"0.0","pressure":"1003","vis":"24","cloud":"6","uvIndex":"5"},{"fxDate":"2020-10-01","sunrise":"06:12","sunset":"17:54","moonrise":"18:04","moonset":"05:11","moonPhase":"满月","tempMax":"21","tempMin":"13","iconDay":"305","textDay":"小雨","iconNight":"150","textNight":"晴","wind360Day":"180","windDirDay":"南风","windScaleDay":"1-2","windSpeedDay":"3","wind360Night":"315","windDirNight":"西北风","windScaleNight":"3-4","windSpeedNight":"16","humidity":"37","precip":"1.0","pressure":"1007","vis":"25","cloud":"55","uvIndex":"4"}],"refer":{"sources":["Weather China"],"license":["no commercial use"]}}';
    final actual = DailyWeatherAnswer.fromJSON(source);
    final code = '200';
    final updateTime = '2020-09-29T12:35+08:00';
    final fxLink = 'http://hfx.link/2ax1';
    final sources = ['Weather China'];
    final license = ['no commercial use'];
    final refer = Refer(sources, license);
    final daily1 = DailyWeather(
        '2020-09-29',
        '06:10',
        '17:57',
        '17:14',
        '03:11',
        '盈凸月',
        '18',
        '9',
        '305',
        '小雨',
        '150',
        '晴',
        '45',
        '东北风',
        '1-2',
        '3',
        '315',
        '西北风',
        '1-2',
        '3',
        '71',
        '6.3',
        '1011',
        '24',
        '85',
        '1');
    final daily2 = DailyWeather(
        '2020-09-30',
        '06:11',
        '17:55',
        '17:40',
        '04:12',
        '盈凸月',
        '21',
        '13',
        '101',
        '多云',
        '305',
        '小雨',
        '180',
        '南风',
        '1-2',
        '3',
        '180',
        '南风',
        '1-2',
        '3',
        '55',
        '0.0',
        '1003',
        '24',
        '6',
        '5');
    final daily3 = DailyWeather(
        '2020-10-01',
        '06:12',
        '17:54',
        '18:04',
        '05:11',
        '满月',
        '21',
        '13',
        '305',
        '小雨',
        '150',
        '晴',
        '180',
        '南风',
        '1-2',
        '3',
        '315',
        '西北风',
        '3-4',
        '16',
        '37',
        '1.0',
        '1007',
        '25',
        '55',
        '4');
    final daily = [daily1, daily2, daily3];
    final matcher = DailyWeatherAnswer(code, updateTime, fxLink, refer, daily);
    expect(actual.code, matcher.code);
  });

  test('序列化', () {
    final code = '200';
    final updateTime = '2020-09-29T12:35+08:00';
    final fxLink = 'http://hfx.link/2ax1';
    final sources = ['Weather China'];
    final license = ['no commercial use'];
    final refer = Refer(sources, license);
    final daily1 = DailyWeather(
        '2020-09-29',
        '06:10',
        '17:57',
        '17:14',
        '03:11',
        '盈凸月',
        '18',
        '9',
        '305',
        '小雨',
        '150',
        '晴',
        '45',
        '东北风',
        '1-2',
        '3',
        '315',
        '西北风',
        '1-2',
        '3',
        '71',
        '6.3',
        '1011',
        '24',
        '85',
        '1');
    final daily2 = DailyWeather(
        '2020-09-30',
        '06:11',
        '17:55',
        '17:40',
        '04:12',
        '盈凸月',
        '21',
        '13',
        '101',
        '多云',
        '305',
        '小雨',
        '180',
        '南风',
        '1-2',
        '3',
        '180',
        '南风',
        '1-2',
        '3',
        '55',
        '0.0',
        '1003',
        '24',
        '6',
        '5');
    final daily3 = DailyWeather(
        '2020-10-01',
        '06:12',
        '17:54',
        '18:04',
        '05:11',
        '满月',
        '21',
        '13',
        '305',
        '小雨',
        '150',
        '晴',
        '180',
        '南风',
        '1-2',
        '3',
        '315',
        '西北风',
        '3-4',
        '16',
        '37',
        '1.0',
        '1007',
        '25',
        '55',
        '4');
    final daily = [daily1, daily2, daily3];
    final answer = DailyWeatherAnswer(code, updateTime, fxLink, refer, daily);
    final actual = answer.toJSON();
    final matcher =
        '{"code":"200","updateTime":"2020-09-29T12:35+08:00","fxLink":"http://hfx.link/2ax1","daily":[{"fxDate":"2020-09-29","sunrise":"06:10","sunset":"17:57","moonrise":"17:14","moonset":"03:11","moonPhase":"盈凸月","tempMax":"18","tempMin":"9","iconDay":"305","textDay":"小雨","iconNight":"150","textNight":"晴","wind360Day":"45","windDirDay":"东北风","windScaleDay":"1-2","windSpeedDay":"3","wind360Night":"315","windDirNight":"西北风","windScaleNight":"1-2","windSpeedNight":"3","humidity":"71","precip":"6.3","pressure":"1011","vis":"24","cloud":"85","uvIndex":"1"},{"fxDate":"2020-09-30","sunrise":"06:11","sunset":"17:55","moonrise":"17:40","moonset":"04:12","moonPhase":"盈凸月","tempMax":"21","tempMin":"13","iconDay":"101","textDay":"多云","iconNight":"305","textNight":"小雨","wind360Day":"180","windDirDay":"南风","windScaleDay":"1-2","windSpeedDay":"3","wind360Night":"180","windDirNight":"南风","windScaleNight":"1-2","windSpeedNight":"3","humidity":"55","precip":"0.0","pressure":"1003","vis":"24","cloud":"6","uvIndex":"5"},{"fxDate":"2020-10-01","sunrise":"06:12","sunset":"17:54","moonrise":"18:04","moonset":"05:11","moonPhase":"满月","tempMax":"21","tempMin":"13","iconDay":"305","textDay":"小雨","iconNight":"150","textNight":"晴","wind360Day":"180","windDirDay":"南风","windScaleDay":"1-2","windSpeedDay":"3","wind360Night":"315","windDirNight":"西北风","windScaleNight":"3-4","windSpeedNight":"16","humidity":"37","precip":"1.0","pressure":"1007","vis":"25","cloud":"55","uvIndex":"4"}],"refer":{"sources":["Weather China"],"license":["no commercial use"]}}';
    expect(actual, matcher);
  });
}
