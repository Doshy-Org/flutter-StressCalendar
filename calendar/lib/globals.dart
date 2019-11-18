import 'package:intl/intl.dart' show DateFormat;
import 'package:weather/weather.dart';
import 'dart:async';

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
String formattedMonth = DateFormat('MMMM').format(now);
WeatherStation weatherStation = new WeatherStation("8afefe5a7cf45d6d97405b23ca3a60b4");
Weather weather;
void weathernoises() async
{
  weather = await weatherStation.currentWeather();
}