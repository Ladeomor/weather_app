import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/map_controller.dart';
import 'package:weather_app/dark_theme_provider.dart';
import 'package:weather_app/views/screens/next_screen.dart';
import 'package:weather_app/widgets/appbar.dart';
import 'package:weather_app/widgets/hourly_widget.dart';
import 'package:weather_app/widgets/top_widget.dart';

import 'package:geocoding/geocoding.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController weatherController =
  Get.put(WeatherController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);


    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade100,
      body: SafeArea(
        child: Obx(() {
          return weatherController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                children:[ ListView(
                    scrollDirection: Axis.vertical,
                    children: [

                      CustomAppBar(context: context, actions: [
                       Switch(
                           value: themeProvider.isDarkMode,
                           onChanged: (value){
                             final provider = Provider.of<ThemeProvider>(context, listen: false);
                             provider.toggleTheme(value);

                       },
                         activeColor: Colors.grey,
                         activeTrackColor: Colors.purpleAccent.withOpacity(0.4),
                       )
                      ],),

                      TopContainer(
                      weatherDataCurrent: weatherController.getData().getCurrentWeather(),
                        ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Today',style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),),
                            Spacer(),
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: (){
                                Get.to(() => NextScreen());
                              },
                                child: Text('Next 7 days',style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),)),
                            Icon(Icons.arrow_forward_ios, size: 14,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HourlyDataWidget(weatherDataHourly: weatherController.getData().getHourlyWeather()),
                      )

                    ],
                  ),

          ]
              );

        }),
      ),
    );
  }
}
