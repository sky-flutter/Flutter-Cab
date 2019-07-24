import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cancel_trip_feedback.dart';
import 'dialog/payment_dialog.dart';
import 'dialog/promo_code_dialog.dart';

class DriverOnTheWay extends StatefulWidget {
  @override
  _DriverOnTheWayState createState() => _DriverOnTheWayState();
}

class _DriverOnTheWayState extends State<DriverOnTheWay> {
  var _ahmedabad = LatLng(23.0225, 72.5714);
  var _ahmedabad1 = LatLng(23.038304, 72.511856);

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
              key: Key("map"),
              onMapCreated: _onMapCreated,
              markers: markers,
              initialCameraPosition:
                  CameraPosition(target: _ahmedabad, zoom: 14),
            ),
            Align(
              key: Key("address"),
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 24),
                child: Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 10,
                              margin: EdgeInsets.only(left: 16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              height: 10,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Text(
                                  "R.A Mel Mawatha",
                                  style: CustomTextStyle.regularTextStyle
                                      .copyWith(color: Colors.grey.shade800),
                                ),
                              ),
                              flex: 100,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                onPressed: () {})
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 10,
                              margin: EdgeInsets.only(left: 16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              height: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                                margin: EdgeInsets.only(left: 16),
                                child: Text(
                                  "WTC East Tower",
                                  style: CustomTextStyle.regularTextStyle
                                      .copyWith(color: Colors.grey.shade800),
                                ),
                              ),
                              flex: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            new MaterialPageRoute(
                                builder: (context) =>
                                    CancelTripFeedback()));
                      },
                      padding:
                          EdgeInsets.symmetric(horizontal: 48, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      color: Colors.black.withOpacity(0.5),
                      textColor: Colors.white,
                      child: Text(
                        "Cancel Trip",
                        style: CustomTextStyle.mediumTextStyle
                            .copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              key: Key("drive_details"),
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 250,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16))),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    margin: EdgeInsets.only(left: 16, top: 16),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/driver.jpg")),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    margin: EdgeInsets.only(left: 16, top: 86),
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: Colors.black.withOpacity(0.5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "4.5",
                                          style: CustomTextStyle.boldTextStyle
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 16),
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
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Nihal Perera",
                                      style: CustomTextStyle.mediumTextStyle
                                          .copyWith(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "On the way",
                                      style: CustomTextStyle.mediumTextStyle
                                          .copyWith(
                                              fontSize: 16,
                                              color:
                                                  Colors.tealAccent.shade700),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "CBC5687 ",
                                              style:
                                                  CustomTextStyle.boldTextStyle.copyWith(color: Colors.black)),
                                          TextSpan(
                                              text: "-",
                                              style:
                                              CustomTextStyle.mediumTextStyle.copyWith(color: Colors.grey,fontSize: 16)),
                                          TextSpan(
                                              text: " Toyota prius (white)",
                                              style:
                                              CustomTextStyle.regularTextStyle.copyWith(color: Colors.grey))
                                        ]),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 16),
                            color: Colors.grey.shade300,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Payment",
                                        style: CustomTextStyle.regularTextStyle,
                                      ),
                                      padding: EdgeInsets.only(top: 14, bottom: 14),
                                    ),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return PaymentDialog();
                                          });
                                    },
                                  ),
                                  flex: 50,
                                ),
                                Container(
                                  width: 1,
                                  height: 40,
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return PromoCodeDialog();
                                          });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Promo Code",
                                        style: CustomTextStyle.regularTextStyle
                                            .copyWith(color: Colors.grey),
                                      ),
                                      padding: EdgeInsets.only(top: 14, bottom: 14),
                                    ),
                                  ),
                                  flex: 50,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: () {
                              },
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              child: Text(
                                "Call Driver",
                                style: CustomTextStyle.mediumTextStyle
                                    .copyWith(color: Colors.white),
                              ),
                              color: Colors.tealAccent.shade400,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                              padding: EdgeInsets.all(16),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.my_location,
                            color: Colors.black,
                          ),
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(1, 1),
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ]),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.black,
                          ),
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(1, 1),
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ]),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
