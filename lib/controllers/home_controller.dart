import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_conditions/model/weather_forecast.dart';
import 'package:weather_conditions/service/weather_api.dart';

class HomeController extends GetxController {
  final TextEditingController cityTextController = TextEditingController();

  final RxList<Forecast> weatherForecasts = List<Forecast>().obs;
  final RxBool isLoading = false.obs;
  final RxBool isFahrenheit = false.obs;
  final RxBool isDarkMode = false.obs;

  final WeatherAPI weatherAPI;

  HomeController(this.weatherAPI);

  @override
  void onInit() async {
    await GetStorage.init();
    final box = GetStorage();
    isFahrenheit.value = box.read("isFahrenheit")?? false;
    isDarkMode.value = box.read("isDarkMode")?? false;
    if(isDarkMode.value) Get.changeTheme(ThemeData.dark());
    super.onInit();
  }

  @override
  void dispose() {
    cityTextController.dispose();
    super.dispose();
  }

  /// Call Weather API to get 5 days weather forecast
  /// for the searched city
  void getForecasts() async {
    if (isLoading.value) return;

    isLoading.value = true;
    String city = cityTextController.text;
    try {
      weatherForecasts.value = await weatherAPI.getWeatherForecasts(city,
          isFahrenheit: isFahrenheit.value);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("error".tr, "error_city".tr,
          duration: Duration(seconds: 4),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.primaryColorDark,
          margin: EdgeInsets.all(0),
          borderRadius: 0,
          colorText: Colors.white);
    }
  }

  void changeUnits(){
    isFahrenheit.toggle();
    final box = GetStorage();
    box.write("isFahrenheit", isFahrenheit.value);
  }

  void changeTheme(){
    isDarkMode.toggle();
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
    final box = GetStorage();
    box.write("isDarkMode", isDarkMode.value);
  }
}
