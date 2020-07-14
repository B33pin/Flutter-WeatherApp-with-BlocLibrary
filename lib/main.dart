import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherappwithbloc/bloc/weather_bloc.dart';
import 'package:weatherappwithbloc/data/fetch_weather_data.dart';
import 'package:weatherappwithbloc/screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      BlocProvider(create: (BuildContext context) { return WeatherBloc(FetchRepo()); },
      child: SearchScreen()),
    );
  }
}