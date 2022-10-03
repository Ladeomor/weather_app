import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/map_controller.dart';
import 'package:weather_app/dark_theme_provider.dart';
import 'package:weather_app/models/weather/hourly.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({Key? key, required this.weatherDataHourly}) : super(key: key);

  RxInt cardIndex = WeatherController().getIndex();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      height: 120,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: weatherDataHourly.hourly.length > 12 ? 12: weatherDataHourly.hourly.length,
        itemBuilder: (BuildContext context, int index) {
            return Obx((() => GestureDetector(
              onTap: (){
                cardIndex.value = index;
              },
              child: Container(
                width: 70,
                margin: const EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                  color: themeProvider.isDarkMode ? Colors.grey.shade800: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    cardIndex.value == index ?
                    BoxShadow(offset: Offset(0.5, 0),
                      blurRadius: 1,
                      color: Colors.white.withAlpha(150)
                    ):
                    BoxShadow(
                      color: themeProvider.isDarkMode ? Colors.grey.withOpacity(0): Colors.white,
                      spreadRadius: themeProvider.isDarkMode ?2: 1,
                      blurRadius: themeProvider.isDarkMode?2 : 1,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                    ],


                  gradient: cardIndex.value == index ?LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.purpleAccent.shade100, Colors.yellow.shade200, ]):null,
                ),
                child: HourlyWidgetDetails(
                  temperature: weatherDataHourly.hourly[index].temp!.toInt(),
                  icon: weatherDataHourly.hourly[index].weather![0].icon!, timeStamp: weatherDataHourly.hourly[index].dt!,
                  color: cardIndex.value == index || themeProvider.isDarkMode ? Colors.white : Colors.black,


                ),

              ),
            ))
            );
        },),

    );
  }
}


class HourlyWidgetDetails extends StatelessWidget {
  int temperature;
  int timeStamp;
  String icon;
  Color color;
  String getTime(final timeStamp){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }
  HourlyWidgetDetails({Key? key, required this.color,required this.temperature, required this.icon, required this.timeStamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
            child: Text("${temperature/10}°", style: GoogleFonts.poppins(color: color, fontSize: 12),)

        ),
        Container(
          child: Image.asset('assets/images/$icon.png', height: 30,)
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
            child: Text(getTime(timeStamp), style: GoogleFonts.poppins(color: Colors.grey.shade300, fontSize: 12)),

        )
      ],
    );
  }
}


