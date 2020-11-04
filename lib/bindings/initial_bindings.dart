import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather_conditions/controllers/home_controller.dart';
import 'package:weather_conditions/service/weather_api.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherAPI(Dio()));
    Get.lazyPut<HomeController>(
        () => HomeController(Get.find<WeatherAPI>()));
  }
}
