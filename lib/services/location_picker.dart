import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location_service.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;
  final LocationService _locationService=LocationService();

  Placemark? _currentLocationName;
  Placemark? get currentLocationName=>_currentLocationName;


  Future<void> findPosition() async {
    bool serviceEnabled;

    LocationPermission _permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      _currentPosition = null;
      notifyListeners();
      return;
    }

    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) ;
    {
      _permission = await Geolocator.requestPermission();

      if (_permission == LocationPermission.denied) {
        _currentPosition = null;
        notifyListeners();
        return;
      }
    }

    if (_permission == LocationPermission.deniedForever) {
      _currentPosition = null;
      notifyListeners();
      return;
    }

    _currentPosition = await Geolocator.getCurrentPosition();
    print(_currentPosition);

    _currentLocationName=await _locationService.getLocationName(_currentPosition);

    print(_currentLocationName);

    notifyListeners();
  }

  //ask the location

  //get the location

  //get the place
}
