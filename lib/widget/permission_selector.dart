import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Relative Imports
import '../provider/geolocator_provider.dart';
import '../screens/permission_access.dart';
import '../screens/main_screen.dart';

class PermissionSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GeoLocatorProvider>(builder: (_, model, child) {
      return FutureBuilder(
          future: model.checkPermissionForLocation(),
          builder: (_, perSnapshot) {
            if (perSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (perSnapshot.data == false) {
              return PermissionAccessScreen(
                model: model,
              );
            } else {
              return MainScreen();
            }
          });
    });
  }
}
