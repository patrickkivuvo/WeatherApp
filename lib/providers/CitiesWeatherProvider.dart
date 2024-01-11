import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp/constants/Constants.dart';
import 'package:weatherapp/models/CityWeatherInfo.dart';
import 'package:weatherapp/models/DailyWeatherInfo.dart';
import 'package:weatherapp/providers/CitiesProvider.dart';
import 'package:http/http.dart' as http;

final weatherDataListProvider = FutureProvider<List<CityWeatherInfo>>((ref) async {
  final cities = ref.watch(citiesListProvider);

  // Fetch weather data for each city
  final weatherDataList = await Future.wait(
    cities.map((city) async {
      final response = await http.get(
        Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$API_KEY&units=metric"),
      );

      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        print(weatherData);
        final weather = weatherData['weather'][0]['main'] as String;

        final int temperature = (weatherData['main']['temp'] as num).toDouble().round();
        final double min = (weatherData['main']['temp_min'] as num).toDouble();
        final double max = (weatherData['main']['temp_max'] as num).toDouble();
        final String weatherDescription = weatherData['weather'][0]['description'] as String;
        final String icon = weatherData['weather'][0]['icon'] as String;
        final double rainfall = weatherData['rain'] != null ? (weatherData['rain']['1h'] as num).toDouble() : 0.0;
        final int humidity = weatherData['main']['humidity'] as int;

        DailyWeatherInfo dailyWeatherInfo = DailyWeatherInfo(
          date: DateTime.now(),
          temperature: temperature,
          min:min,
          max:max,
          weatherDescription: weatherDescription,
          icon: icon,
          rainfall: rainfall,
          humidity: humidity,
        );

        CityWeatherInfo cityWeatherInfo = CityWeatherInfo(
          city: city, dailyWeatherInfo: dailyWeatherInfo
        );
        print(humidity);
        return cityWeatherInfo;
      } else {
        throw Exception("Failed to load weather data for $city");
      }
    }),
  );

  return weatherDataList;
});
