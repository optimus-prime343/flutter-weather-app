class WeatherInfo {
  final String main;
  final String description;
  final String icon;
  final double temperature;
  final double feelsLike;
  final double visibility;
  final double windSpeed;
  final String city;

  WeatherInfo({
    required this.main,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.feelsLike,
    required this.visibility,
    required this.windSpeed,
    required this.city,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    // see data/api_response.dart for the json structure
    dynamic weather = json['weather'][0];
    dynamic main = json['main'];
    return WeatherInfo(
      main: weather['main'],
      description: weather['description'],
      icon: weather['icon'],
      temperature: main['temp'],
      feelsLike: main['feels_like'],
      // visibility can either be int or double
      // since we can't pass int to double.parse we have to convert it to string first
      visibility: double.parse(json['visibility'].toString()),
      windSpeed: json['wind']['speed'],
      city: json['name'],
    );
  }
}
