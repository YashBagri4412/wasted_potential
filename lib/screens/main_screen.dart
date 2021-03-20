import 'package:flutter/material.dart';
import 'package:savdhaan_app/widget/google_maps_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
//Relative imports
import '../provider/geolocator_provider.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:savdhaan_app/widget/Bottom_panel.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _panelHeightOpen;
  double _panelHeightClosed = 95.0;

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .65;
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
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: GoogleMapsWidget(
              locatioData: snapshot.data,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
            panelBuilder: (ScrollController sc) => BottomPanel(
              sc: sc,
            ),
          );
        },
      ),
    );
  }
}
