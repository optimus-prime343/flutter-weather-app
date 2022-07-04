import 'package:flutter/material.dart';
import 'package:flutter_weather_app/widgets/weather_info.dart';
import '../models/weather_info_model.dart';

import '../services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WeatherInfo> futureWeatherInfo;

  @override
  void initState() {
    futureWeatherInfo = WeatherService.fetchWeatherInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<WeatherInfo>(
          future: futureWeatherInfo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) return Text(snapshot.error.toString());
            return WeatherInfoContainer(
              weatherInfo: snapshot.data!,
            );
          },
        ),
      ),
    );
  }
}
