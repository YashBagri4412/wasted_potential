import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapProvider with ChangeNotifier {
  List<Marker> _safetyMarker = [
    Marker(
      markerId: MarkerId("Mathikhere"),
      position: LatLng(13.0334, 77.5640),
      infoWindow: InfoWindow(title: "safe"),
    ),
    Marker(
      markerId: MarkerId("shivaji"),
      position: LatLng(12.9857, 77.6057),
      infoWindow: InfoWindow(title: "safe"),
    ),
    Marker(
      markerId: MarkerId("RT Nagar"),
      position: LatLng(13.0247, 77.5948),
      infoWindow: InfoWindow(title: "deadly"),
    ),
  ];

  List<Marker> get safetyMarker => _safetyMarker;

  List<Circle> _safetyColors = [
    Circle(
      circleId: CircleId("Mathikhere"),
      center: LatLng(13.0334, 77.5640),
      radius: 400,
      strokeWidth: 2,
    ),
    Circle(
      circleId: CircleId("shivaji"),
      center: LatLng(12.9857, 77.6057),
      radius: 400,
      strokeWidth: 2,
    ),
    Circle(
      circleId: CircleId("Rt Nagar"),
      center: LatLng(13.0247, 77.5948),
      radius: 400,
      strokeWidth: 2,
    ),
  ];

  List<Circle> get safetyColors => _safetyColors;
  //get marker from firebase database
  Future<Set<Marker>> getSafetyMarkerAndCircles(LatLng inititalLocation) {
    BitmapDescriptor.fromJson({});
    //future for fetching data from firebase
    //the response would be mapped to set of Marker class
    //set MarkerID
  }
}
