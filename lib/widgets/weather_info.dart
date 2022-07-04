import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/weather_info_model.dart';

class WeatherInfoContainer extends StatelessWidget {
  final WeatherInfo weatherInfo;
  const WeatherInfoContainer({
    Key? key,
    required this.weatherInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 60.0,
        horizontal: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weatherInfo.city,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 10.0),
          Text(
            DateFormat.yMMMd().format(DateTime.now()),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Image.network(
            'http://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png',
          ),
          Text(
            '${weatherInfo.temperature.toString()}°C',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 10.0),
          Text(
            weatherInfo.main,
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherSummary(
                label: 'HUMIDITY',
                value: '${weatherInfo.humidity.toString()}%',
              ),
              WeatherSummary(
                label: 'WIND',
                value: '${weatherInfo.windSpeed.toString()}km/hr',
              ),
              WeatherSummary(
                label: 'REAL FEEL',
                value: '${weatherInfo.feelsLike.toString()}°C',
              )
            ],
          )
        ],
      ),
    );
  }
}

class WeatherSummary extends StatelessWidget {
  final String label;
  final String value;
  const WeatherSummary({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    );
    return Column(
      children: [
        Text(label, style: textStyle),
        const SizedBox(height: 10.0),
        Text(value, style: textStyle),
      ],
    );
  }
}
