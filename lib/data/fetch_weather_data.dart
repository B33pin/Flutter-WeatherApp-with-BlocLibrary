import 'dart:convert';
import 'package:weatherappwithbloc/constants.dart';
import 'package:weatherappwithbloc/data/weather_repo.dart';
import 'package:weatherappwithbloc/model/weather_model.dart';
import 'package:http/http.dart'as http;
class FetchRepo extends WeatherRepo{
  @override
  Future<Weather> FetchWeather(String cityname) async{
    // TODO: implement FetchWeather
    http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$kApikey');
    if (response.statusCode == 200){
      String data = response.body;
      var ApiDATA = jsonDecode(data);
      return Weather(cityname: cityname, temp:(ApiDATA['main']['temp']-273).toStringAsFixed(2));
    }
    else{
      throw NetworkError();
    }
  }
}
class NetworkError extends Error {}