import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_pb/constants.dart';
import 'package:weather_app_pb/models/current_model.dart';
import 'package:weather_app_pb/models/forecast_model.dart';
import 'package:http/http.dart' as http;

class WeatherProvider with ChangeNotifier {
  double _lat = 0.0;
  double _lon = 0.0;
  String _unit = 'metric';
  String? _city;
  SharedPreferences? _preferences;
  CurrentWeatherResponseModel? currentModel;
  ForecastWeatherResponseModel? forecastModel;
  bool hasCurrentDataLoaded = false;
  bool hasForecastDataLoaded = false;
  WeatherProvider() {
    _load();
  }
  Future<void> _load() async {
    hasCurrentDataLoaded = false;
    hasForecastDataLoaded = false;
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    _lat = position.altitude;
    _lon = position.longitude;
    _unit = getTempUnitStatus() ? 'imperial' : 'metric';
    await _getCurrentData();
    await _getForecastData();
  }

  Future<void> _getCurrentData() async {
    final uri = _city == null
        ? Uri.parse(
            'http://api.openweathermap.org/data/2.5/weather?lat=$_lat&lon=$_lon&units=$_unit&appid=$weather_api_key')
        : Uri.parse(
            'http://api.openweathermap.org/data/2.5/weather?q=$_city&units=$_unit&appid=$weather_api_key');
    try {
      final response = await http.get(uri);
      final map = json.decode(response.body);
      currentModel = CurrentWeatherResponseModel.fromJson(map);
      hasCurrentDataLoaded = true;
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  Future<void> _getForecastData() async {
    final uri = _city == null
        ? Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?lat=$_lat&lon=$_lon&units=$_unit&appid=$weather_api_key')
        : Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?q=$_city&units=$_unit&appid=$weather_api_key');

    try {
      final response = await http.get(uri);
      final map = json.decode(response.body);
      forecastModel = ForecastWeatherResponseModel.fromJson(map);
      hasForecastDataLoaded = true;
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  void setTempUnitStatus(bool status) async {
    await _preferences!.setBool('unit', status);
    _load();
  }

  bool getTempUnitStatus() => _preferences!.getBool('unit') ?? false;

  void setNewCity(String? query) {
    _city = query;
    _load();
  }
}
