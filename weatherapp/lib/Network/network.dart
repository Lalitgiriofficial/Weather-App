import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/Util/appid.dart';
import '../model/weather_forecast_model.dart';
import 'package:http/http.dart'as http;
import 'package:weatherapp/util/appid.dart';
class Network  {
var appid="54c8f7e51ce137f5c24c33038d42e68e";

  Future<Weatherforecastmodel> getWeatherForecast ({required String cityname}) async{
    var finalurl="http://api.openweathermap.org/data/2.5/forecast?q="+cityname+"&exclude=hourly&mode=json&appid=$appid&units=metric";

    // ignore: non_constant_identifier_names
    final Response = await http.get(Uri.parse(finalurl));
    //print("URl: ${Uri.encodeFull(finalurl)}");
    if( Response.statusCode ==200){
      // print("Weather data: ${Response.body}");

      return Weatherforecastmodel.fromJson(Response.body);

    }else{
      throw Exception("Errror");
    }


  }

}