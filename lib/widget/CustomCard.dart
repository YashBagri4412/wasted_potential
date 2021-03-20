import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 180,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5,
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: const EdgeInsets.all(20),
                leading: Icon(
                  FontAwesomeIcons.shieldAlt,
                  size: 50,
                ),
                title: Text('Police Station'),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
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
      ),
    );
  }
}
