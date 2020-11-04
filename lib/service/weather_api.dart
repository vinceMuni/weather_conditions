import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather_conditions/model/weather_forecast.dart';

class WeatherAPI {
  final Dio dio;

  static const String WEATHER_FORECAST_URL =
      "http://api.openweathermap.org/data/2.5/forecast/daily";
  static const String QUERY_PARAM = "q";
  static const String COUNT_PARAM = "cnt";
  static const String APP_ID = "appid";
  static const String UNITS = "units";
  static const String LANGUAGE = "lang";

  static const String API_KEY = "613e5eb182194fc07ab0e6242b0b9978";
  static const int MAX_DAYS = 5;
  static const String METRIC = "metric";
  static const String IMPERIAL = "imperial";

  WeatherAPI(this.dio);

  Future<List<Forecast>> getWeatherForecasts(String city,
      {bool isFahrenheit = false}) async {
    var forecastResponse =
        await dio.post(WEATHER_FORECAST_URL, queryParameters: {
      QUERY_PARAM: city,
      COUNT_PARAM: MAX_DAYS,
      UNITS: isFahrenheit ? IMPERIAL : METRIC,
      LANGUAGE: Get.locale.countryCode.toLowerCase(),
      APP_ID: API_KEY
    });
    if (forecastResponse.statusCode == 200 && forecastResponse.data != null) {
      WeatherForecast forecast =
          WeatherForecast.fromJson(forecastResponse.data);
      return forecast.forecasts;
    } else {
      throw Exception('Cannot load data for this city');
    }
  }
}
