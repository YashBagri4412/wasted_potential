import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_config/flutter_config.dart';

Future<void> openMap(
    double initlat, double initlng, double finallat, double finallng) async {
  String googleUrl =
      'https://www.google.com/maps/dir/?api=1&origin=$initlat,$initlng&destination=$finallat,$finallng';
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  } else {
    throw 'Could not open the map.';
  }
}
