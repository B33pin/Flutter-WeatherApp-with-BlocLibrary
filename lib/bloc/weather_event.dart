part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}
class WeatherDetail extends WeatherEvent{
  String cityname;
  WeatherDetail(this.cityname);
  @override
  // TODO: implement props
  List<Object> get props => [cityname];

}
