import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/map_controller.dart';
import 'package:weather_app/dark_theme_provider.dart';
import 'package:weather_app/widgets/daily_forecast.dart';
import 'package:weather_app/widgets/next_container.dart';


class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final WeatherController weatherController =
  Get.put(WeatherController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Next 7 days', style: GoogleFonts.poppins(fontSize: 14),),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.grey.shade300,
        elevation: 0,
        foregroundColor: themeProvider.isDarkMode ? Colors.white : Colors.black,
      ),
      body: SafeArea(
        child: Obx(() {
          return weatherController.checkLoading().isTrue
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Stack(
              children:[
                SingleChildScrollView(
                  child: Column(
                children: [
                  NextCard(weatherDataDaily: weatherController.getData().getDailyWeather(),),
                  SizedBox(height: 20,),
                  DailyForecast(weatherDataDaily: weatherController.getData().getDailyWeather(),)



                ],
              ),
          )

              ]
          );
        }),
      ),


    );
  }
}
