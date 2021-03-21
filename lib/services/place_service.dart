import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';

Future<Map<String, dynamic>> getData(
    String typein, String lat, String lng) async {
  var response = await http.get(
      "https://maps.googleapis.com/maps/api/place/textsearch/json?type=$typein&location=$lat,$lng&rankby=distance&key=${FlutterConfig.get('GOOGLE_MAPS_API_KEY')} ");
  var data = json.decode(response.body);
  var placeid = data['results'][0]["place_id"];
  response = await http.get(
      "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeid&key=${FlutterConfig.get('GOOGLE_MAPS_API_KEY')}");
  data = json.decode(response.body);
  //print(data["result"]["name"]);
  // print(data["result"]["formatted_phone_number"]);

  var l1 = {
    'name': data["result"]["name"],
    'phone': data["result"]["formatted_phone_number"],
    'lat': data['result']['geometry']['location']['lat'],
    'lng': data['result']['geometry']['location']['lng'],
  };

  print(l1);
  return l1;
}
