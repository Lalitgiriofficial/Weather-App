import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/Util/GenerateIcon.dart';
import 'package:weatherapp/Util/appid.dart';
import 'package:weatherapp/model/weather_forecast_model.dart';

Widget forecastCard(AsyncSnapshot<Weatherforecastmodel> snapshot,int index){

  var Forecastlist = snapshot.data!.list;
  String weatherDescription=snapshot.data!.list[index].weather[0].main.toString();
  print(weatherDescription);
  var dayofweek="";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch((Forecastlist[index].dt) * 1000);
  var fulldate=util.getFormattedDate(date);
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Row(

      children: [
        Text(fulldate,style: TextStyle(color: Colors.black,fontSize: 15),),
            Spacer(),
          getWeatherIcon( weatherdescription:weatherDescription , color: Colors.white,size: 30),
        Padding(
          padding: const EdgeInsets.only(left:40.0),
          child: Text("${Forecastlist[index].main.temp.toStringAsFixed(0)}°C",style: TextStyle(color: Colors.black,fontSize: 15),),
        )
      ],
    ),
  );
}