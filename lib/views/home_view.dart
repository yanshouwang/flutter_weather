import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_weather/models/daily_weather.dart';
import 'package:flutter_weather/models/now_weather.dart';
import 'package:flutter_weather/view_models/home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel;

  _HomeViewState() : _homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: Image.asset(
                    'assets/images/location.png',
                    width: 24.0,
                  ),
                  onPressed: _onLocationPressed,
                ),
                CupertinoButton(
                  child: Image.asset(
                    'assets/images/settings.png',
                    width: 24.0,
                  ),
                  onPressed: _onSettingsPressed,
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            StreamBuilder<NowWeather>(
              stream: _homeViewModel.nowWeatherStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                final text = snapshot.hasData ? snapshot.data.text : '';
                final icon = snapshot.hasData ? snapshot.data.icon : '100';
                final temp = snapshot.hasData ? snapshot.data.temp : '';
                return Column(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '北京',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Image.asset(
                      'assets/images/$icon.png',
                      width: 160,
                    ),
                    Text(
                      '$temp°',
                      style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: Container(),
            ),
            StreamBuilder<List<DailyWeather>>(
                stream: _homeViewModel.dailyWeatherStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  final icon =
                      snapshot.hasData ? snapshot.data[1].iconDay : '100';
                  final temp = snapshot.hasData ? snapshot.data[1].tempMax : '';
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '明天',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          'assets/images/$icon.png',
                          width: 32,
                        ),
                      ),
                      Text(
                        '$temp°',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                }),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  void _onLocationPressed() {
    _homeViewModel.loadWeather();
  }

  void _onSettingsPressed() {}
}
