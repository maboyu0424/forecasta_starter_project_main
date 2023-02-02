import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/model/wheather_data_daily.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/widgets/daily_forecast.dart';
import 'package:weatherapp_starter_project/widgets/flood_forecast.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_weather_widget.dart';

import '../widgets/current_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(() => globalController.checkLoading().isTrue
          ? Center(
              child: Image.asset(
                "assets/icons/weatherapp.png",
                height: 200,
                width: 200,
              ),
            )
          : Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const HeaderWidget(),
                  //For the current temperature
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        globalController.getData().getCurrentWeather(),
                  ),
                  HourlyDataWidget(
                    weatherDataHourly:
                        globalController.getData().getHourlyWeather(),
                  ),
                  DailyDataForecast(
                    weatherDataDaily:
                        globalController.getData().getDailyWeather(),
                  ),
                  Container(
                    height: 1,
                    color: CustomerColors.dividerLine,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FloodForecast(
                      weatherDataDaily:
                          globalController.getData().getDailyWeather()),
                ],
              ),
            )),
    ));
  }
}
