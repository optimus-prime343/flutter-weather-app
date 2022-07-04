import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather_info_model.dart';
import 'location_service.dart';

class WeatherService {
  static Future<WeatherInfo> fetchWeatherInfo() async {
    try {
      final String? apiKey = dotenv.env['OPEN_WEATHER_API_KEY'];
      if (apiKey == null) {
        throw Future.error(
          'Please dont forget to include OPEN_WEATHER_API_KEY in .env file',
        );
      }
      final Dio dio = Dio();
      Position position = await LocationService.determinePosition();
      Response response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=$apiKey',
      );
      Map<String, dynamic> data = response.data;
      return WeatherInfo.fromJson(data);
    } catch (error) {
      throw Future.error(error);
    }
  }
}
