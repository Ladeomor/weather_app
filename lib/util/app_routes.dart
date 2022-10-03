import 'package:get/get.dart';
import 'package:weather_app/views/screens/home_screen.dart';
import 'package:weather_app/views/screens/next_screen.dart';

class AppRoutes{
  AppRoutes._();
  static const inital = '/homeScreen';
  static final routes = [
    GetPage(name: '/homeScreen', page: () => HomeScreen(), transition: Transition.zoom),
    GetPage(name: '/nextScreen', page: () => NextScreen(), transition: Transition.fadeIn),

  ];
}