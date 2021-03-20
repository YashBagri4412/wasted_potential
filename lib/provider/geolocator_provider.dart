import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorProvider with ChangeNotifier {
  bool _isPermissionGiven;
  //getter
  bool get isPermissionGiven => _isPermissionGiven;
  //setter
  set setPermission(LocationPermission status) {
    if (status == LocationPermission.denied) {
      _isPermissionGiven = false;
    } else if (status == LocationPermission.deniedForever) {
      _isPermissionGiven = false;
    } else if (status == LocationPermission.always) {
      _isPermissionGiven = true;
    } else if (status == LocationPermission.whileInUse) {
      _isPermissionGiven = true;
    }
  }

  Future<void> askPermisssion() async {
    try {
      final response = await Geolocator.requestPermission();
      setPermission = response;
    } on PlatformException catch (error) {
      print("${error.toString()} : error from the platform}");
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<bool> checkPermissionForLocation() async {
    try {
      final response = await Geolocator.checkPermission();
      setPermission = response;
      print(_isPermissionGiven);
    } on PlatformException catch (error) {
      print("${error.toString()} : error from the platform}");
    } catch (e) {
      print(e);
      return false;
    }
    return this._isPermissionGiven;
  }
}
