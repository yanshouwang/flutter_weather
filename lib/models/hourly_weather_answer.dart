import 'hourly_weather.dart';
import 'refer.dart';
import 'weather_answer.dart';

class HourlyWeatherAnswer extends WeatherAnswer {
  final List<HourlyWeather> hourly;

  HourlyWeatherAnswer(
      String code, String updateTime, String fxLink, Refer refer, this.hourly)
      : super(code, updateTime, fxLink, refer);
}
