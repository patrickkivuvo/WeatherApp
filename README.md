# Weather App

Weather App is a Flutter application that allows users to check the weather forecast for the next five days.

## Features

- Display the current weather information for a default city.
- Allow users to dynamically change the city and see the weather forecast.
- Show a five-day weather forecast with details such as temperature, weather description, and icons.
- Provide additional information like cloud cover, pressure, humidity, and wind speed.

## Getting Started

To get started with the Weather App, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/iZeroKim/WeatherApp.git
   
2. Navigate to the project directory:

    ```bash
    cd weather-app

3. Install dependencies:

    ```bash
    flutter pub get
    
4. Run the application:

    ```bash
    flutter run

## Configuration
To configure the default city or API key, update the respective constants in the lib/constants/Constants.dart file.
    ```bash

    //lib/constants/Constants.dart
    class Constants {
      static const String API_KEY = 'your_openweathermap_api_key';
      static const String DEFAULT_CITY = 'Nairobi';
    }
##Dependencies
The Weather App relies on the following key dependencies:

http for making HTTP requests.
flutter_riverpod for state management.
intl for date formatting.

To install these dependencies, update your pubspec.yaml file:
    ```bash
    
    dependencies:
      flutter:
        sdk: flutter
      http: ^0.13.3
      flutter_riverpod: ^0.15.0
      intl: ^0.17.0

##Screenshots

<img src="https://github.com/iZeroKim/WeatherApp/assets/58791465/fbdd3a5b-6d8f-4d05-a2c6-70a77b1d218a" data-canonical-src="https://github.com/iZeroKim/WeatherApp/assets/58791465/fbdd3a5b-6d8f-4d05-a2c6-70a77b1d218a" width="200" height="400" />


<img src="https://github.com/iZeroKim/WeatherApp/assets/58791465/a127e42b-951f-4ec0-92b1-31fa08b3d786" data-canonical-src="https://github.com/iZeroKim/WeatherApp/assets/58791465/a127e42b-951f-4ec0-92b1-31fa08b3d786" width="200" height="400" />




##License
This project is licensed under the MIT License.
    
