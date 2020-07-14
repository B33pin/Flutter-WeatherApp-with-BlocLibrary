import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherappwithbloc/bloc/weather_bloc.dart';
import 'package:weatherappwithbloc/model/weather_model.dart';
import '../constants.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(20, 130, 20, 50),
                  child: BlocListener<WeatherBloc, WeatherState>(
                    listener: (BuildContext context, state) {
                      if(state is WeatherError){
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (BuildContext context, state) {
                        if (state is WeatherInitial) {
                          return initaial();
                        } else if (state is WeatherLoading) {
                          return Loading();
                        } else if (state is WeatherLoaded) {
                          return WeatherWithDAta(state.weather);
                        } else if (state is WeatherError) {
                          return initaial();
                        }
                      },
                    ),
                  )),
            ],
          ),
        ) /* add child content here */,
      ),
    );
  }
}

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String cname;
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
          style: TextStyle(
            color: Colors.black,
          ),
          onChanged: (value){
            cname = value;
          }, decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: (){
        weatherBloc.add(WeatherDetail(cname));
        },icon: Icon(Icons.search),),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Enter The City Name',
        hintStyle: TextStyle(
            color: Colors.grey
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide.none
        ),
      ),),
    );
  }
}

Widget initaial() {
  return Center(
    child: InputField(),
  );
}

Widget Loading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

class WeatherWithDAta extends StatelessWidget {
  Weather weather;
  WeatherWithDAta(this.weather);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'It is ${weather.temp}°C in ${weather.cityname}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.w500,
            color: Colors.deepOrange,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(height: 60,),
        InputField(),
      ],
    );
  }
}
