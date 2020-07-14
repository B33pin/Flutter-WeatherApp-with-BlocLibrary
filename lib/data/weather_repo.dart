import 'package:weatherappwithbloc/model/weather_model.dart';

abstract class WeatherRepo {
Future<Weather> FetchWeather(String cityname);
}