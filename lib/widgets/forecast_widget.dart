import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_conditions/model/weather_forecast.dart';
import 'package:weather_conditions/utils/app_text.dart';
import 'package:weather_conditions/utils/date_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForecastWidget extends StatelessWidget {
  final Forecast forecast;
  final bool isFahrenheit;

  const ForecastWidget(
      {Key key, @required this.forecast, this.isFahrenheit = false})
      : super(key: key);

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
                      "${_getMinTemp()}",
                      isBold: true,
                      size: 18.sp,
                    ),
                    AppText("min_t".tr)
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    AppText(
                      "${_getMaxTemp()}",
                      isBold: true,
                      size: 18.sp,
                    ),
                    AppText("max_t".tr)
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
    String minTemp = "";
    if (forecast.temp.min is double) {
      minTemp = forecast.temp.min.toStringAsFixed(0);
    } else {
      minTemp = forecast.temp.min.toString();
    }
    minTemp =
        '$minTemp${isFahrenheit ? 'fahrenheit_degrees'.tr : 'celsius_degrees'.tr}';
    return minTemp;
  }

  String _getMaxTemp() {
    String maxTemp = "";
    if (forecast.temp.max is double) {
      maxTemp = forecast.temp.max.toStringAsFixed(0);
    } else {
      maxTemp = forecast.temp.max.toString();
    }
    maxTemp =
        '$maxTemp${isFahrenheit ? 'fahrenheit_degrees'.tr : 'celsius_degrees'.tr}';
    return maxTemp;
  }
}
