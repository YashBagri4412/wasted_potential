import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatefulWidget {
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildContainer(
          'Near by police Station',
          Icon(
            FontAwesomeIcons.shieldAlt,
            size: 50,
          ),
          'sadashivanagar police station',
        ),
        buildContainer(
          'Near by Hospital',
          Icon(
            FontAwesomeIcons.hospital,
            size: 50,
          ),
          'M.S Ramiah Hospital',
        ),
      ],
    );
  }

  Container buildContainer(String s, Icon icon, String sub) {
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
              title: Text(s),
              subtitle: Text(sub),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {},
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
                  onPressed: () {},
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
