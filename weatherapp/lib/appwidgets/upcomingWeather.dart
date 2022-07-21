import 'package:flutter/material.dart';
import 'package:weatherapp/Util/appid.dart';
import 'package:weatherapp/appwidgets/forecastCard.dart';
import '../model/weather_forecast_model.dart';

Widget upcomingWeather(
    AsyncSnapshot<Weatherforecastmodel> snapshot, BuildContext context) {
  var Forecastlist = snapshot.data!.list;
  return Container(
    height: 320,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(70),
          topLeft: Radius.circular(10)),
    ),
    child: Padding(
      padding:
          const EdgeInsets.only(top: 25.0, bottom: 25, left: 10, right: 10),
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var dayofweekcurr = "";
            DateTime currdate = new DateTime.fromMillisecondsSinceEpoch(
                (Forecastlist[index].dt) * 1000);
            var fulldatecurr = util.getFormattedDate(currdate);
            dayofweekcurr = fulldatecurr.split(",")[0];
            var dayofweeknext = "";
            DateTime nextdate = new DateTime.fromMillisecondsSinceEpoch(
                (Forecastlist[index + 1].dt) * 1000);
            var fulldatenext = util.getFormattedDate(nextdate);
            dayofweeknext = fulldatenext.split(",")[0];
            if (dayofweeknext != dayofweekcurr) {
              return ClipRect(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: forecastCard(snapshot, index),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 1,
              ),
          itemCount: Forecastlist.length - 1),
    ),
  );
}
