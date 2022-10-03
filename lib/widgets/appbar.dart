import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/map_controller.dart';
import 'package:weather_app/dark_theme_provider.dart';


class CustomAppBar extends StatefulWidget {

  List<Widget>? actions;
  bool? automaticallyImplyLeading;
  Widget? leading;
  BuildContext context;


   CustomAppBar({Key? key, required this.actions, this.automaticallyImplyLeading, this.leading,required this.context}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  String location = "";
  final WeatherController weatherController =
  Get.put(WeatherController(), permanent: true);

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      location = place.locality!;
    });
  }

  @override
  void initState() {
    getAddress(weatherController.getLatitude().value,
        weatherController.getLongitude().value);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return AppBar(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.grey.shade300,
      automaticallyImplyLeading: widget.automaticallyImplyLeading ?? true,
      leading: widget.leading,
      elevation: 0.0,
      centerTitle: true,
      actions: widget.actions,
      title: Text(
        location,
        style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
