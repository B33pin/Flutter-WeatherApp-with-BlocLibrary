import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Weather extends Equatable {
  String cityname;
  String temp;

  Weather(
      {@required this.cityname,
      @required this.temp,});

  @override
  // TODO: implement props
  List<Object> get props => [cityname, temp];
}
