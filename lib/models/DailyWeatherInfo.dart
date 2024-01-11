class DailyWeatherInfo {
  final DateTime date;
  final int temperature;
  final double min;
  final double max;
  final String weatherDescription;
  final String icon;
  final double rainfall;
  final int humidity;

  DailyWeatherInfo({
    required this.date,
    required this.temperature,
    required this.min,
    required this.max,
    required this.weatherDescription,
    required this.icon,
    required this.rainfall,
    required this.humidity,
  });
}