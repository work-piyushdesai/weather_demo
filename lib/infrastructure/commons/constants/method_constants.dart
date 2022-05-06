import 'dart:developer';
import 'dart:io' as io;
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:weather_demo/infrastructure/commons/constants/image_constants.dart';

class MethodConstants {
  static Future<bool> isInternetAvailable() async {
    try {
      final result = await io.InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on io.SocketException catch (_) {
      return false;
    }
  }

  static String getEventCreatedDate({required String timeStamp}) {
    String willPrintDate = "";

    var weekDayFormat = DateFormat.E();
    var dayFormat = DateFormat.d();
    var monthFormat = DateFormat.MMM();
    //var timeFormat = DateFormat.jm();

    var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp));

    willPrintDate = weekDayFormat.format(date) +
        ", " +
        dayFormat.format(date) +
        " " +
        monthFormat.format(date) +
        " " +
        DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp))
            .year
            .toString() +
        " " +
        "at" +
        " " +
        /*timeFormat.format(date) +
        " " +*/
        DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp)).timeZoneName;

    return willPrintDate.replaceAll("AM", "am").replaceAll("PM", "pm");
  }

  static String forecastImage({required String images}){
    String image = "";

    switch(images){
      case "Thunderstorm":
        image = ImageConstants.thunderstorm;
        break;
      case "Rain":
        image = ImageConstants.rainImage;
        break;
      case "Clouds":
        image = ImageConstants.cloudImage;
        break;
      case "Clear":
        image = ImageConstants.sunSvg;
        break;
      case "Drizzle":
        image = ImageConstants.cloudWithSun;
        break;
      case "Snow":
        image = ImageConstants.rainImage;
        break;
      case "Haze":
        image = ImageConstants.sunSvg;
        break;
      default:
        image = ImageConstants.sunSvg;
        break;
    }
    return image;
  }

  static String getDate({required int timestamp}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String time = DateFormat("dd MMMM").format(date);
    return time;
  }

  static String getHours({required int timestamp}) {

    DateTime hours = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String data = DateFormat("HH:mm").format(hours);
    return data;
  }

  static Future<LocationData> getLocation() async {
    Location location = Location();
    LocationData pos = await location.getLocation();
    log("message: $pos");
    return pos;

  }


}
