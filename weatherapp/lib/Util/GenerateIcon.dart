import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon(
    {required String weatherdescription,
    required Color color,
    required double size}) {
  switch (weatherdescription) {
    case "clear":
      return Icon(
        FontAwesomeIcons.sun,
        color: color,
        size: size,
      );
      break;
    case "Clouds":
      return Icon(
        FontAwesomeIcons.cloud,
        color: color,
        size: size,
      );
      break;
    case "Rain":
      return Icon(
        FontAwesomeIcons.cloudShowersHeavy,
        color: color,
        size: size,
      );
      break;
    case "few clouds":
      return Icon(
        FontAwesomeIcons.cloud,
        color: color,
        size: size,
      );
    case "light rain":
      return Icon(
      FontAwesomeIcons.cloudShowersHeavy,
      color: color,
      size: size,
    );
    case "clear sky":
      return Icon(
      FontAwesomeIcons.sun,
      color: color,
      size: size,
    );
    case "Snow":
      return Icon(
        FontAwesomeIcons.snowman,
        color: color,
        size: size,
      );
      break;
    default:
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
      break;
  }
}

Widget getWeatherImage(String weatherdescription) {
  switch (weatherdescription) {
    case "clear":
      return Image.asset(
        "assets/sun-svg.gif",
        scale: 5,
      );
    case "Clouds":
      return Image.asset(
        "assets/cloudy-svg.gif",
        scale: 5,
      );
    case "Rain":
      return Image.asset(
        "assets/rain-svg.gif",
        scale: 5,
      );
    case "Snow":
      return Image.asset(
        "assets/snowflake-svg.gif",
        scale: 5,
      );
    default:
      {
        return Image.asset(
          "assets/sun-svg.gif",
          scale: 5,
        );
      }
  }
}
