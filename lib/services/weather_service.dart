import 'dart:convert';
import 'dart:io';

import 'package:flutter_weather/models/daily_weather.dart';
import 'package:flutter_weather/models/daily_weather_answer.dart';
import 'package:flutter_weather/models/hourly_weather.dart';
import 'package:flutter_weather/models/now_weather.dart';
import 'package:flutter_weather/models/now_weather_answer.dart';

class WeatherService {
  static const key = 'ed72879db4614cf88827621c3762bc12';

  Future<NowWeather> getNowAsync() async {
    final client = HttpClient();
    try {
      final url = Uri.parse(
          'https://devapi.heweather.net/v7/weather/now?location=101010100&key=$key');
      final request = await client.getUrl(url);
      final response = await request.close();
      final source = await response.transform(utf8.decoder).join();
      final answer = NowWeatherAnswer.fromJSON(source);
      if (answer.code != '200') {
        throw Exception(answer.code);
      }
      return answer.now;
    } finally {
      client.close();
    }
  }

  Future<List<HourlyWeather>> getHourlyAsync() {
    throw Exception();
  }

  Future<List<DailyWeather>> getDailyAsync() async {
    final client = HttpClient();
    try {
      final url = Uri.parse(
          'https://devapi.heweather.net/v7/weather/3d?location=101010100&key=$key');
      final request = await client.getUrl(url);
      final response = await request.close();
      final source = await response.transform(utf8.decoder).join();
      final answer = DailyWeatherAnswer.fromJSON(source);
      if (answer.code != '200') {
        throw Exception(answer.code);
      }
      return answer.daily;
    } finally {
      client.close();
    }
  }
}
