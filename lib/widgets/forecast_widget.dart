import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_conditions/model/weather_forecast.dart';
import 'package:weather_conditions/utils/app_text.dart';
import 'package:weather_conditions/utils/date_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForecastWidget extends StatelessWidget {
  final Forecast forecast;

  const ForecastWidget({Key key, @required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            _getDay(),
            isBold: true,
            size: 18.sp,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 16.0),
            child: Row(
              children: [
                Image.network(
                  _getWeather().icon,
                  width: 40.w,
                  height: 40.h,
                ),
                Expanded(
                                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: AppText(
                      "${GetUtils.capitalize(_getWeather().description)}",
                      isBold: true,
                      size: 16.sp,
                      align: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    AppText(
                      "${_getMinTemp()}°",
                      isBold: true,
                      size: 18.sp,
                    ),
                    AppText("Min T.")
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    AppText(
                      "${_getMaxTemp()}°",
                      isBold: true,
                      size: 18.sp,
                    ),
                    AppText("Max T.")
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Weather _getWeather() {
    var weather = Weather();
    if (forecast.weather.isNotEmpty) {
      weather = forecast.weather[0];
    }
    return weather;
  }

  String _getDay() {
    var dateInMillis = forecast.dt * 1000;
    return DateTime.fromMillisecondsSinceEpoch(dateInMillis)
        .getDayFromDateTime();
  }

  String _getMinTemp() {
    if (forecast.temp.min is double)
      return forecast.temp.min.toStringAsFixed(0);
    else
      return forecast.temp.min.toString();
  }

  String _getMaxTemp() {
    if (forecast.temp.max is double)
      return forecast.temp.max.toStringAsFixed(0);
    else
      return forecast.temp.max.toString();
  }
}
