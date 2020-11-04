import 'package:get/get.dart';
import 'package:weather_conditions/widgets/home.dart';
part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.HOME, page:()=> Home(),)
  ];
}