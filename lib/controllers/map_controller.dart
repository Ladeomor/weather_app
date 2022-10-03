import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather/current.dart';
import 'package:weather_app/models/weather/weather.dart';

class WeatherController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final RxInt currentIndex = 0.obs;

  RxBool checkLoading() => isLoading;
  RxDouble getLatitude() => latitude;
  RxDouble getLongitude() => longitude;

  final weatherData = WeatherData().obs;

  WeatherData getData(){
    return weatherData.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (isLoading.isTrue) {
      getLocation();
    }else{
      getIndex();
    }
    super.onInit();
  }



  getLocation() async {
    bool isLocationEnabled;
    LocationPermission locationPermission;

    isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return Future.error("Location is not enabled");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location is not denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location is not denied");
      }
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      latitude.value = value.latitude;
      longitude.value = value.longitude;

      return FetchApi().getWeatherData(value.latitude, value.longitude).then((value){
        isLoading.value = false;
        weatherData.value = value!;

      });
    });
  }
  RxInt getIndex(){
    return currentIndex;
  }
}
