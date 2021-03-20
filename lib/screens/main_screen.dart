import 'package:flutter/material.dart';
import 'package:savdhaan_app/widget/google_maps_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
//Relative imports
import '../provider/geolocator_provider.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Position>(
        future: Provider.of<GeoLocatorProvider>(context, listen: false)
            .getLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error.toString()}"),
            );
          }
          return SlidingUpPanel(
            body: GoogleMapsWidget(
              locatioData: snapshot.data,
            ),
            panel: Center(
              child: Text("Places here"),
            ),
          );
        },
      ),
    );
  }
}
