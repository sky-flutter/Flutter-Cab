import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cab/home/driver_on_the_way.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CancelTrip extends StatefulWidget {
  @override
  _CancelTripState createState() => _CancelTripState();
}

class _CancelTripState extends State<CancelTrip> {
  var _ahmedabad = LatLng(23.0225, 72.5714);
  var _ahmedabad1 = LatLng(23.038304, 72.511856);
  var _ahmedabad2 = LatLng(23.036769, 72.562601);
  var _ahmedabad3 = LatLng(22.996224, 72.602492);
  var _ahmedabad4 = LatLng(23.040403, 72.585802);
  Set<Marker> markers = new Set();

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GoogleMapController mapController;

  BitmapDescriptor bitmapDescriptor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addMarker();
  }

  addMarker() {
    markers.add(createMarker("ahmedabad", _ahmedabad));
    markers.add(createMarker("ahmedabad1", _ahmedabad1));
    markers.add(createMarker("ahmedabad2", _ahmedabad2));
    markers.add(createMarker("ahmedabad3", _ahmedabad3));
    markers.add(createMarker("ahmedabad4", _ahmedabad4));
  }

  createMarker(String id, LatLng latLng) {
    return Marker(
      markerId: MarkerId(id),
      position: latLng,
    );
  }

  void _onMapCreated(GoogleMapController mapController) {
    this.mapController = mapController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              markers: markers,
              initialCameraPosition:
                  CameraPosition(target: _ahmedabad, zoom: 14),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 240,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16)),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 70,
                          ),
                          Text(
                            "Nihal Perera",
                            style: CustomTextStyle.boldTextStyle,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4, right: 4, top: 2),
                            child: Text(
                              "Requesting your ride please wait...",
                              style: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                              child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 16),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            DriverOnTheWay()));
                              },
                              color: Colors.grey.shade200,
                              child: Text(
                                "Cancel Trip",
                                style: CustomTextStyle.mediumTextStyle,
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/driver.jpg")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 100,
                          margin: EdgeInsets.only(top: 70),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.black.withOpacity(0.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "4.5",
                                style: CustomTextStyle.boldTextStyle.copyWith(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellowAccent.shade700,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
