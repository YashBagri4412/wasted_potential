import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:savdhaan_app/services/place_service.dart';
import 'package:savdhaan_app/widget/CustomCard.dart';

class BottomPanel extends StatefulWidget {
  final ScrollController sc;
  final String ilat;
  final String ilng;
  BottomPanel({this.sc, this.ilat, this.ilng});

  @override
  _BottomPanelState createState() => _BottomPanelState();
}

class _BottomPanelState extends State<BottomPanel> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        controller: widget.sc,
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Safe',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('elevated button');
                },
                child: Text(
                  "EMERGENCY",
                  style: TextStyle(fontSize: 18),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ],
          ),
          // rest code....
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: getData('police', widget.ilat, widget.ilng),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error.toString()}"),
                  );
                }
                if (snapshot.hasData) {
                  return CustomCard(
                    title: 'Nearest police station',
                    subtitle: '${snapshot.data['name']}',
                    icon: Icon(
                      FontAwesomeIcons.shieldAlt,
                      size: 50,
                    ),
                    initlat: double.parse(widget.ilat),
                    initlng: double.parse(widget.ilng),
                    flat: snapshot.data['lat'],
                    flng: snapshot.data['lng'],
                    phone: '100',
                  );
                }
                return Center(child: Text('Loading..'));
              }),
          FutureBuilder(
              future: getData('hospital', widget.ilat, widget.ilng),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error.toString()}"),
                  );
                }

                if (snapshot.hasData) {
                  return CustomCard(
                    title: 'Nearest hospital',
                    subtitle: '${snapshot.data['name']}',
                    icon: Icon(
                      FontAwesomeIcons.hospital,
                      size: 50,
                    ),
                    initlat: double.parse(widget.ilat),
                    initlng: double.parse(widget.ilng),
                    flat: snapshot.data['lat'],
                    flng: snapshot.data['lng'],
                    phone: snapshot.data['phone'],
                  );
                }
                return Center(child: Text('Loading..'));
              }),
        ],
      ),
    );
  }
}
