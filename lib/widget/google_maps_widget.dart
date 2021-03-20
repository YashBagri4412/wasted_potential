import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:savdhaan_app/provider/google_map_provider.dart';

class GoogleMapsWidget extends StatefulWidget {
  final Position locatioData;
  GoogleMapsWidget({@required this.locatioData});

  @override
  _GoogleMapsWidgetState createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<GoogleMapProvider>(context, listen: false)
        .getSafetyMarkerAndCircles();
  }

  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: widget.locatioData,
      stream: Geolocator.getPositionStream(),
      builder: (_, liveLocationsnapshot) {
        if (liveLocationsnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (liveLocationsnapshot.hasError) {
          return Center(
            child: Text(liveLocationsnapshot.error.toString()),
          );
        }
        return Consumer<GoogleMapProvider>(
          builder: (_, mapModel, child) {
            return GoogleMap(
              markers: Set.from(mapModel.safetyMarker),
              circles: Set.from(mapModel.safetyColors),
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  liveLocationsnapshot.data.latitude,
                  liveLocationsnapshot.data.longitude,
                ),
                zoom: 12,
              ),
              myLocationEnabled: true,
            );
          },
        );
      },
    );
  }
}
