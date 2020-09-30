import 'dart:async';

import 'package:flutter_weather/models/daily_weather.dart';
import 'package:flutter_weather/models/now_weather.dart';
import 'package:flutter_weather/services/weather_service.dart';

class HomeViewModel {
  final WeatherService _weatherService;
  final StreamController<NowWeather> _nowWeatherController;
  final StreamController<List<DailyWeather>> _dailyWeatherController;

  Stream<NowWeather> get nowWeatherStream => this._nowWeatherController.stream;
  Stream<List<DailyWeather>> get dailyWeatherStream =>
      this._dailyWeatherController.stream;

  HomeViewModel()
      : _weatherService = WeatherService(),
        _nowWeatherController = StreamController<NowWeather>.broadcast(),
        _dailyWeatherController =
            StreamController<List<DailyWeather>>.broadcast() {
    this.loadWeather();
  }

  void loadWeather() async {
    final nowWeather = await _weatherService.getNowAsync();
    this._nowWeatherController.add(nowWeather);
    final dailyWeathers = await _weatherService.getDailyAsync();
    this._dailyWeatherController.add(dailyWeathers);
  }

  void dispose() {
    this._nowWeatherController.close();
    this._dailyWeatherController.close();
  }
}
