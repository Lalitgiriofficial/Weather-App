import 'package:flutter/material.dart';
import 'package:weatherapp/Util/GenerateIcon.dart';
import 'package:weatherapp/model/weather_forecast_model.dart';
import 'package:weatherapp/Util/appid.dart';

Widget UIPage(AsyncSnapshot<Weatherforecastmodel> snapshot) {
  var Forecastlist = snapshot.data!.list;
  var city = snapshot.data!.city.name;
  var country = snapshot.data!.city.country;
  var forecastlist = snapshot.data!.list[0];
  var formatteddate;
  formatteddate =
      new DateTime.fromMillisecondsSinceEpoch(forecastlist.dt * 1000);
  String dt = util.getformatteddate(formatteddate);
  return Column(
    children: [
      Text(
        "Today",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            wordSpacing: 2,
            letterSpacing: 2),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "$city, $country",
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: <Color>[
                  Colors.pinkAccent,
                  Colors.deepPurpleAccent,
                  Colors.red
                  //add more color here.
                ],
              ).createShader(Rect.fromLTWH(100.0, 100.0, 250.0, 100.0))),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        dt,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            wordSpacing: 2,
            letterSpacing: 2),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        height: 150,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getWeatherImage(forecastlist.weather[0].main.toString()),
            Container(
              height: 70,
              width: 4,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${forecastlist.main.temp.toStringAsFixed(0)}°C",
                  style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.w200,
                      letterSpacing: -5,
                      color: Colors.black87),
                ),
                Text(
                  forecastlist.weather[0].description,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Colors.black45,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/humidity.png"),
                      fit: BoxFit.fill,
                      scale: 0.8,
                    ),
                  ),
                  height: 50,
                  width: 50,
                ),
                Text(
                  "${forecastlist.main.humidity.toString()} %",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/cloud.png"),
                      fit: BoxFit.fill,
                      scale: 0.8,
                    ),
                  ),
                  height: 50,
                  width: 50,
                ),
                Text(
                  "${forecastlist.clouds.all.toString()} %",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    "assets/wind.png",
                    scale: 0.2,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  "${forecastlist.wind.speed.toString()} Km/h",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}
