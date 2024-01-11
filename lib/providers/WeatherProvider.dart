import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/DailyWeatherInfo.dart';

final cityProvider = StateProvider<String>((ref) => "Nairobi"); // Default city name

final weatherProvider = FutureProvider.autoDispose((ref) async {
  const apiKey = "7d621ffc22b3ee1d8e96058d56432737";
  final city = ref.watch(cityProvider);
  print("\n\n\ncity : $city");

  for (int retry = 0; retry < 3; retry++) {
    try {
      final response = await http.get(
        Uri.parse('http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric'),
      );

      if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
    print("Response ${response.body}");
    // Extracting the list of forecasts
    final List<dynamic> forecasts = decodedResponse['list'];

    // Extracting relevant information for each day
    final List<DailyWeatherInfo> dailyInfoList = [];
    for (int i = 0; i < 5; i++) {
      final Map<String, dynamic> forecast = forecasts[i * 8]; // Assuming data is available every 3 hours
      final int temperature = forecast['main']['temp'].toDouble().round();
      final double min = forecast['main']['temp_min'].toDouble();
      final double max = forecast['main']['temp_max'].toDouble();
      final String weatherDescription = forecast['weather'][0]['description'];
      final String icon = forecast['weather'][0]['icon'];
      final double rainfall = forecast['rain'] != null ? forecast['rain']['3h'].toDouble() : 0.0;
      final int humidity = forecast['main']['humidity'];

      dailyInfoList.add(DailyWeatherInfo(
        date: DateTime.now().add(Duration(days: i)),
        temperature: temperature,
        min:min,
        max:max,
        weatherDescription: weatherDescription,
        icon: icon,
        rainfall: rainfall,
        humidity: humidity,
      ));
    }


        return dailyInfoList;
      } else {
        // Handle error
        print("Response ${response.body}");
        print('Failed to load weather data');
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // If all retries fail, throw an exception
  throw Exception('Failed to load weather data after multiple retries');
});

