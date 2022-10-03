import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/dark_theme_provider.dart';
import 'package:weather_app/models/weather/daily.dart';

class NextCard extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const NextCard({Key? key, required this.weatherDataDaily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Stack(
      // alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 70.0),
          alignment: Alignment.topCenter,
          height: 250.0,
          decoration: BoxDecoration(
              color: themeProvider.isDarkMode ? Colors.black : Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.elliptical(25, 10),
                bottomRight: Radius.elliptical(25, 10),
              )
          ),
        ),
        Positioned(
          top: 20,
          left: 30,
          right: 30,
          child:
            Container(
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.purpleAccent, Colors.yellow.shade300, ]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, ),
                child: Column(

                  children: [
                    Text('Tomorrow', style: GoogleFonts.poppins(fontSize: 24, color: Colors.white54,fontWeight: FontWeight.w400,) ),
                    Row(
                      children: [
                        Image.asset("assets/images/${weatherDataDaily.daily[ 1].weather![0].icon}.png"),
                        SizedBox(width: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: RichText(text: TextSpan(
                            children: [
                            TextSpan(
                            text: "${weatherDataDaily.daily[1].temp!.max!/10}",
                              style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white54,)
                          ),
                              TextSpan(
                                  text: "/",
                                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white54,)
                              ),
                            TextSpan(
                                text: "${weatherDataDaily.daily[1].temp!.min!/10}°",
                                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white54,)
                            ),

                      ],

                          )
    ),
                        )
    ]
                    ),
                    Text(weatherDataDaily.daily[1].weather![0].description!.toUpperCase(), style: GoogleFonts.poppins(fontSize: 15, color: Colors.white54) ),

                  ],
                ),
              ),
            ),





        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),

              height: 130,
              width: 300,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(

                    children: [
                      Image.asset('assets/images/wind.png', color: Colors.purpleAccent.shade100, height: 30,),
                      SizedBox(height: 10,),

                      Text("${weatherDataDaily.daily[1].windSpeed}km/h", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, ),),
                      Text("Wind", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),)

                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      Image.asset('assets/images/humidity.png', color: Colors.purpleAccent.shade100, height: 20,width: 50, ),
                      SizedBox(height: 20,),

                      Text("${weatherDataDaily.daily[1].humidity}%", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),),
                      Text("Humidity", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),)


                    ],
                  ),
                  SizedBox(width: 10,),

                  Column(
                    children: [
                      Image.asset('assets/images/visibility.png', color: Colors.purpleAccent.shade100, height: 30,),
                      SizedBox(height: 10,),
                      Text(weatherDataDaily.daily[1].visibility == null ? "N/A": "${weatherDataDaily.daily[1].visibility}km", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),),
                      Text("Visibility", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),)


                    ],
                  )



                ],
              ),
            ),
          ),
        ),


      ],
    );
  }
}
