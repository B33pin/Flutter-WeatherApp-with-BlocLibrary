import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherappwithbloc/data/fetch_weather_data.dart';
import 'package:weatherappwithbloc/data/weather_repo.dart';
import 'package:weatherappwithbloc/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;
  WeatherBloc(this.weatherRepo) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield WeatherLoading();
    if (event is WeatherDetail){
      try{
      final weather = await weatherRepo.FetchWeather(event.cityname);
      yield WeatherLoaded(weather: weather);
    } on NetworkError {
        yield WeatherError(message: "Couldn't fetch weather. Is the device online?");
      }
    }
  }
}
