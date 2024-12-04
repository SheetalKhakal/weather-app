import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  String? _errorMessage;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final String _apiKey = 'ec5ea7eaa990e190791ddf7b69ecf7dd';

  Future<void> fetchWeather(String cityName) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/weather',
          queryParameters: {
            'q': cityName,
            'appid': _apiKey,
            'units': 'metric'
          });
      _weather = Weather.fromJson(response.data);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('lastCity', cityName);
    } on DioError catch (e) {
      _weather = null;
      if (e.response?.statusCode == 404) {
        _errorMessage = "The city is not found.";
      } else {
        _errorMessage = "There is no internet connection.";
      }
    } catch (e) {
      _errorMessage = "Failed to fetch weather data.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadLastCity() async {
    final prefs = await SharedPreferences.getInstance();
    final lastCity = prefs.getString('lastCity');

    if (lastCity != null) {
      await fetchWeather(lastCity);
    }
  }
}
