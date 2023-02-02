import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/model/wheather_data_daily.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class FloodForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const FloodForecast({super.key, required this.weatherDataDaily});

  double getFloodRate() {
    double? r1 = weatherDataDaily.daily[0].rain;
    double? r2 = weatherDataDaily.daily[1].rain;
    double? r3 = weatherDataDaily.daily[2].rain;
    double? r4 = weatherDataDaily.daily[3].rain;
    double? r5 = weatherDataDaily.daily[4].rain;
    double r6 = (r1! + r2! + r3! + r4! + r5!) / 100;
    return r6;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            "Risk of floods",
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue:
                      // getFloodRate()
                      100,
                  appearance: CircularSliderAppearance(
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                            CustomerColors.thirdGradientColor.withAlpha(100),
                        progressBarColors: [
                          CustomerColors.fourthGradientColor,
                          CustomerColors.thirdGradientColor,
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
