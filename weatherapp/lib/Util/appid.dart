import 'package:intl/intl.dart';

class util{
  static String Appid="54c8f7e51ce137f5c24c33038d42e68e";
  static String getformatteddate(DateTime){
    return new DateFormat("dd MMM, y").format(DateTime);
  }
  static String getFormattedDate(DateTime){
    return new DateFormat("EEEE,  dd MMM ").format(DateTime);
  }
}