import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/dark_theme_provider.dart';
import 'package:weather_app/models/weather/daily.dart';

class DailyForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const DailyForecast({Key? key, required this.weatherDataDaily}) : super(key: key);
  String getDay(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat('EEE').format(time);
    return x;
  }
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
       itemCount: weatherDataDaily.daily.length > 7 ? 7: weatherDataDaily.daily.length,

          itemBuilder:(context, index) {
         return Column(
           children: [
             Container(
               height: 60,
               padding: EdgeInsets.only(left: 10, right: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     width: 80,
                       child: Text(getDay(weatherDataDaily.daily[index].dt,),style: GoogleFonts.poppins(fontSize: 12, color: themeProvider.isDarkMode ? Colors.white : Colors.black87))),
                   SizedBox(
                     height: 30,
                     width: 150,
                     child: Row(
                       children: [
                         Image.asset("assets/images/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                         SizedBox(width: 2,),
                         Text(weatherDataDaily.daily[index].weather![0].description!, style: GoogleFonts.poppins(fontSize: 12, color: themeProvider.isDarkMode ? Colors.white : Colors.black) ),

                       ],
                     ),
                   ),
                   Container(
                       child: Text("${weatherDataDaily.daily[index].temp!.max!/10}/${weatherDataDaily.daily[index].temp!.min!/10}", style: GoogleFonts.poppins(fontSize: 12, color: themeProvider.isDarkMode ? Colors.white : Colors.black)),
                   ) ],
               ),
             ),


           ],
         );
            
          }) );
  }
}
