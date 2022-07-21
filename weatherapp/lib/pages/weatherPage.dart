import 'package:flutter/material.dart';
import 'package:weatherapp/Network/network.dart';
import 'package:weatherapp/appwidgets/upcomingWeather.dart';
import 'package:weatherapp/pages/No_InternetPage.dart';
import 'package:weatherapp/model/weather_forecast_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weatherapp/pages/uiPage.dart';
import 'dart:async';

class WeatherPage extends StatefulWidget {
  String cityname;

  @override
  State<WeatherPage> createState() => _WeatherPageState();

  WeatherPage({required this.cityname});
}

class _WeatherPageState extends State<WeatherPage> {
  Future<Weatherforecastmodel>? cityWeather;
  String citynm = "Delhi";
  ConnectivityResult? _connectivityResult;

  late StreamSubscription _connectivitySubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cityWeather = getWeather(widget.cityname);
    _checkConnectivityState();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      _connectivityResult = result;
    });
  }

  @override
  dispose() {
    super.dispose();

    _connectivitySubscription.cancel();
  }

  Future<void> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NoInternet()));
    }
  }

  Future<Weatherforecastmodel> getWeather(String cityname) =>
      new Network().getWeatherForecast(cityname: cityname);

  @override
  Widget build(BuildContext context) {
    if (_connectivityResult == ConnectivityResult.none) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/no_internet.png"),
            )),
      );
    } else {
      return SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: FutureBuilder<Weatherforecastmodel>(
                    future: cityWeather,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(children: [
                          textfieldview(),
                          SizedBox(
                            height: 10,
                          ),
                          UIPage(snapshot),
                          upcomingWeather(snapshot, context)
                        ]);
                      } else {
                        return Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: CircularProgressIndicator(
                              color: Colors.grey,
                              strokeWidth: 2,
                            )));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    }
  }

  Widget textfieldview() {
    return Container(
      child: TextField(
        cursorHeight: 25,
        decoration: InputDecoration(
            hintText: "enter city name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8)),
        onSubmitted: (var value) {
          setState(() {
            citynm = value;
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>
                    WeatherPage(cityname: citynm)));
          });
        },
      ),
    );
  }
}
