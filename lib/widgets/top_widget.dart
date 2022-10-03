import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/dark_theme_provider.dart';
import 'package:weather_app/models/weather/current.dart';

class TopContainer extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  TopContainer({Key? key, required this.weatherDataCurrent}) : super(key: key);

  String date = DateFormat('yMMMMd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Stack(
      
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(

          margin: EdgeInsets.only(bottom: 70.0),
          alignment: Alignment.topCenter,
          height: 400.0,
          decoration: BoxDecoration(
              color: themeProvider.isDarkMode ? Colors.black : Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.elliptical(25, 10),
                bottomRight: Radius.elliptical(25, 10),
              )
          ),
      ),
        Positioned(
          right: 50,
          left: 50,
          top: 0,
          child: Align(
            // alignment: Alignment.topRight,
            child: Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white54),
              child: Center(
                child: Text(
                  date,
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        // Positioned(
        //     top: 200,
        //     right: 0,
        //     left: 0,
        //     child: Container(
        //       height: 50,
        //       width: 100,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(30), color: Colors.white54),
        //       child: Text(
        //         date,
        //         style: GoogleFonts.poppins(fontSize: 13),
        //       ),
        //     )),

        Container(
          height: 450,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 20, right: 20),

                child: Positioned(
                  top: 20,
                  bottom: 10,
                  left: 50,
                  right: 50,
                  child: Stack(children: [

                    Container(
                      height: 220,
                      width: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.purpleAccent, Colors.yellow.shade300,]),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Text(weatherDataCurrent.current.weather![0].description!
                                .toUpperCase(), style: GoogleFonts.poppins(
                                fontSize: 13, color: Colors.white54)),
                            Text('${weatherDataCurrent.current.temp!.round() /
                                10}°', textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize: 78,
                                fontWeight: FontWeight.w600,
                                color: Colors.white54,),),
                          ],
                        ),
                      ),
                    ),

                    // Positioned(top: 30, right: 10, child: Blob.random(size: 100, styles: BlobStyles(color: Colors.white.withOpacity(0.2)),)),


                    Positioned(
                        top: 130,
                        right: 50,
                        left: 50,
                        child: Image.asset(
                          "assets/images/${weatherDataCurrent.current.weather![0]
                              .icon}.png", width: 200,)),
                    // Positioned(bottom: 30, left: -10, child: Blob.random(size: 60, edgesCount: 50, styles: BlobStyles(color: Colors.red),)),

                  ]),


                ),
              );
            }
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
                      blurRadius: 7,
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

                        Text("${weatherDataCurrent.current.windSpeed}km/h", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),),
                        Text("Wind", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),)

                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Image.asset('assets/images/humidity.png', color: Colors.purpleAccent.shade100, height: 20,width: 50, ),
                        SizedBox(height: 20,),

                        Text("${weatherDataCurrent.current.humidity}%", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),),
                        Text("Humidity", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),)


                      ],
                    ),
                    SizedBox(width: 10,),

                    Column(
                      children: [
                        Image.asset('assets/images/visibility.png', color: Colors.purpleAccent.shade100, height: 30,),
                        SizedBox(height: 10,),
                        Text("${weatherDataCurrent.current.clouds}%", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),),
                        Text("Visibility", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),)


                      ],
                    )



                  ],
                ),
              ),
         ),
       ),


    ]


    );
  }
}
