import 'package:location/location.dart';

class LocationHelper{
late   double latitude;
late double longtiude;

Future<void> getCurrentLocation() async{
  Location location = Location();

  bool _servisEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _servisEnabled = await location.serviceEnabled();

  if(!_servisEnabled) {
    _servisEnabled = await location.requestService();
    if(!_servisEnabled){
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if(_permissionGranted == PermissionStatus.denied){
    _permissionGranted = await location.requestPermission();

    if(_permissionGranted != PermissionStatus.granted){
      return;
    }
  }

  _locationData = await location.getLocation();
  latitude = _locationData.latitude!;
  longtiude = _locationData.longitude!;
}
}