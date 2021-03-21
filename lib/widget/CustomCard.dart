import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:savdhaan_app/services/call_service.dart';

import 'package:savdhaan_app/services/url_google_maps.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final double initlat;
  final double initlng;
  final double flat;
  final double flng;
  final String phone;
  CustomCard({
    this.title,
    this.subtitle,
    this.icon,
    this.initlat,
    this.initlng,
    this.flat,
    this.flng,
    this.phone,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              leading: icon,
              title: Text(title),
              subtitle: Text(subtitle),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    await makePhoneCall('tel:$phone');
                  },
                  icon: Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                  label: Text(
                    'Call',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                FlatButton.icon(
                  onPressed: () async {
                    await openMap(initlat, initlng, flat, flng);
                  },
                  icon: Icon(
                    FontAwesomeIcons.locationArrow,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Navigate',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
