import 'package:weatherapp/models/DailyWeatherInfo.dart';

class CityWeatherInfo {
  final String city;
  final DailyWeatherInfo dailyWeatherInfo;

  CityWeatherInfo({required this.city, required this.dailyWeatherInfo});
}