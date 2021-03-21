import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GoogleMapProvider with ChangeNotifier {
  List<Marker> _safetyMarker = [
    // Marker(
    //   markerId: MarkerId("Mathikhere"),
    //   position: LatLng(13.0334, 77.5640),
    //   infoWindow: InfoWindow(title: "safe"),
    // ),
    // Marker(
    //   markerId: MarkerId("shivaji"),
    //   position: LatLng(12.9857, 77.6057),
    //   infoWindow: InfoWindow(title: "safe"),
    // ),
    // Marker(
    //   markerId: MarkerId("RT Nagar"),
    //   position: LatLng(13.0247, 77.5948),
    //   infoWindow: InfoWindow(title: "deadly"),
    // ),
  ];

  List<Marker> get safetyMarker => _safetyMarker;

  List<Circle> _safetyColors = [
    // Circle(
    //   circleId: CircleId("Mathikhere"),
    //   center: LatLng(13.0334, 77.5640),
    //   radius: 1000,
    //   strokeWidth: 1,
    //   fillColor: Colors.blue.shade50,
    //   strokeColor: Colors.blue.shade500,
    // ),
    // Circle(
    //   circleId: CircleId("shivaji"),
    //   center: LatLng(12.9857, 77.6057),
    //   radius: 1000,
    //   strokeWidth: 1,
    //   fillColor: Colors.green.shade50,
    //   strokeColor: Colors.green.shade500,
    // ),
    // Circle(
    //   circleId: CircleId("Rt Nagar"),
    //   center: LatLng(13.0247, 77.5948),
    //   radius: 1000,
    //   strokeWidth: 1,
    //   fillColor: Colors.red.shade50,
    //   strokeColor: Colors.red.shade500,
    // ),
  ];

  List<Circle> get safetyColors => _safetyColors;
  //get marker from firebase database
  Future<bool> getSafetyMarkerAndCircles() async {
    //future for fetching data from firebase
    //the response would be mapped to set of Marker class
    //set MarkerID

    final response = await http
        .get("https://gmapauth-default-rtdb.firebaseio.com/location.json?");

    var jsonDecoded = jsonDecode(response.body)["place"];
    for (int i = 0; i < 22; i++) {
      print(i);
      _safetyMarker.add(
        Marker(
          markerId: MarkerId(jsonDecoded[i]["area"]["name"]),
          position: LatLng(
            double.parse(jsonDecoded[i]["area"]["Latitude"]),
            double.parse(jsonDecoded[i]["area"]["Longitude"]),
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            (jsonDecoded[i]["area"]["Numbers"] > 1200)
                ? BitmapDescriptor.hueRed
                : (jsonDecoded[i]["area"]["Numbers"] < 50)
                    ? BitmapDescriptor.hueGreen
                    : BitmapDescriptor.hueYellow,
          ),
          infoWindow: InfoWindow(
            title: jsonDecoded[i]["area"]["name"],
            snippet: jsonDecoded[i]["area"]["Numbers"].toString(),
          ),
        ),
      );
      _safetyColors.add(
        Circle(
          circleId: CircleId(jsonDecoded[i]["area"]["name"]),
          center: LatLng(
            double.parse(jsonDecoded[i]["area"]["Latitude"]),
            double.parse(jsonDecoded[i]["area"]["Longitude"]),
          ),
          fillColor: (jsonDecoded[i]["area"]["Numbers"] > 1200)
              ? Colors.red.withOpacity(0.60)
              : (jsonDecoded[i]["area"]["Numbers"] < 50)
                  ? Colors.green.withOpacity(0.60)
                  : Colors.yellow.withOpacity(0.60),
          strokeColor: (jsonDecoded[i]["area"]["Numbers"] > 1200)
              ? Colors.red.withOpacity(0.60)
              : (jsonDecoded[i]["area"]["Numbers"] < 50)
                  ? Colors.green.withOpacity(0.60)
                  : Colors.yellow.withOpacity(0.60),
          radius: (jsonDecoded[i]["area"]["Numbers"] > 1200)
              ? 1500
              : (jsonDecoded[i]["area"]["Numbers"] < 50)
                  ? 500
                  : 1000,
          strokeWidth: 1,
        ),
      );
    }
    return true;
  }
}
