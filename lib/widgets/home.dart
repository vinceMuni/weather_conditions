import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_conditions/controllers/home_controller.dart';
import 'package:weather_conditions/utils/app_text.dart';
import 'package:weather_conditions/widgets/forecast_widget.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(Get.width, Get.height));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          "app_name".tr,
          isBold: true,
          color: Colors.white,
          size: 20.sp,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                showSettings();
              })
        ],
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: GoogleFonts.lato(fontSize: 18.sp),
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.words,
                          onSubmitted: (s) {
                            controller.getForecasts();
                          },
                          decoration: InputDecoration(
                            hintText: "city_input_hint".tr,
                            hintStyle: GoogleFonts.lato(fontSize: 18.sp),
                          ),
                          controller: controller.cityTextController,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          FocusScope.of(context)
                              .requestFocus(FocusNode()); //Dismiss keyboard
                          controller.getForecasts();
                        },
                        icon: Icon(Icons.search),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, i) {
                            var forecast = controller.weatherForecasts.value[i];
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ForecastWidget(forecast: forecast),
                              ),
                            );
                          },
                          itemCount: controller.weatherForecasts.length,
                          separatorBuilder: (_, i) => Divider(),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSettings() {
    Get.bottomSheet(Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
          child: AppText(
            "",
            isBold: true,
            size: 20.sp,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Expanded(
                child: AppText(
              "celsius".tr,
              align: TextAlign.center,
            )),
            Obx(
              () => Switch.adaptive(
                  value: controller.isFahrenheit.value,
                  onChanged: (v) => controller.changeUnits()),
            ),
            Expanded(child: AppText("fahrenheit".tr, align: TextAlign.center))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Expanded(child: AppText("light_mode".tr, align: TextAlign.center)),
            Obx(
              () => Switch.adaptive(
                  value: controller.isDarkMode.value,
                  onChanged: (v) => controller.changeTheme()),
            ),
            Expanded(child: AppText("dark_mode".tr, align: TextAlign.center))
          ]),
        ),
      ],
    )));
  }
}
