import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_app/weather_map/wModel/weather_forecast_model.dart';
import 'package:udemy_app/weather_map/wNetwork/forecast_network.dart';


class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {

  Future <WeatherForeCastModel> forecastObject;
  String today = DateFormat.yMMMMEEEEd().format(DateTime.now());
  String _cityName = 'Minsk';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getForecastData(cityName: _cityName);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Open weather', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  onSubmitted: (value){
                    setState(() {
                      _cityName = value;
                      forecastObject = Network().getForecastData(cityName: _cityName);
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelText: 'Enter the City Name',
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      FutureBuilder(
                          future: Network().getForecastData(cityName: _cityName),
                          // ignore: non_constant_identifier_names
                          builder: (context, WeatherForeCastModel) {
                            if (WeatherForeCastModel.hasData) {
                              return Text('${WeatherForeCastModel.data.name}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0
                                ),
                              );
                            }
                            return CircularProgressIndicator();
                          }),

                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '$today',
                        style: TextStyle(
                            fontSize: 20.0
                        ),
                      )
                    ],
                  )
                ],
              ),

              Icon(Icons.cloud,
                size: 160.0,
                color: Colors.pinkAccent,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                      future: Network().getForecastData(cityName: _cityName),
                      // ignore: non_constant_identifier_names
                      builder: (context, WeatherForeCastModel) {
                        if (WeatherForeCastModel.hasData) {
                          return Row(

                            children: [
                              Text(
                                '${WeatherForeCastModel.data.main.temp.toString()} ℃ ',
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold
                                ),),
                              Text(
                                WeatherForeCastModel.data.weather[0].description.toString(),
                                style: TextStyle(
                                    fontSize: 20.0
                                ),)
                            ],
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                ],
              )
            ],
          ),
        ]
      ),
    );
  }
}
