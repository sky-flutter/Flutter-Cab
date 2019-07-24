import 'package:flutter/material.dart';
import 'package:flutter_cab/home/trip_info.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dialog/payment_dialog.dart';
import 'dialog/promo_code_dialog.dart';

class TripStarted extends StatefulWidget {
  @override
  _TripStartedState createState() => _TripStartedState();
}

class _TripStartedState extends State<TripStarted> {
  var _ahmedabad = LatLng(23.0225, 72.5714);
  Set<Marker> markers = new Set();

  GoogleMapController mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    markers.add(Marker(
      markerId: MarkerId("ahmedabad"),
      position: _ahmedabad,
    ));
  }

  void _onMapCreated(GoogleMapController mapController) {
    this.mapController = mapController;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition:
                CameraPosition(target: _ahmedabad, zoom: 14),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: markers,
                onMapCreated: _onMapCreated,
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 16),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
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
                    margin: EdgeInsets.symmetric(horizontal: 30),
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
                              margin: EdgeInsets.only(left: 16),
                              padding: EdgeInsets.only(top: 16, bottom: 16),
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
                    onPressed: () {},
                    child: Text(
                      "Cancel Trip",
                      style: CustomTextStyle.regularTextStyle,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    color: Colors.black.withOpacity(0.6),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.traffic,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.4)),
                      ),
                      Expanded(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                                  color: Colors.white,
                                ),
                                margin: EdgeInsets.only(top: 24),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 80,
                                          height: 80,
                                          margin: EdgeInsets.only(top: 16,left: 10),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            image: DecorationImage(
                                                image:
                                                AssetImage("images/driver.jpg")),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        SizedBox(width: 16,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 20,),
                                            Container(
                                              child: Text("Nihal Perera",style: CustomTextStyle.mediumTextStyle,),
                                            ),
                                            SizedBox(height: 6),
                                            Container(
                                              child: Text("Trip Started",style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.tealAccent.shade400),),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(6),
                                              margin: EdgeInsets.only(top: 6),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(4),
                                                  border: Border.all(color: Colors.grey,width: 1)
                                              ),
                                              child: RichText(
                                                text: TextSpan(
                                                    children: [
                                                      TextSpan(text: " CBC5687 ",style: CustomTextStyle.boldTextStyle.copyWith(color: Colors.black)),
                                                      TextSpan(text: " - ",style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.grey)),
                                                      TextSpan(text: " Toyota Prius(white) ",style: CustomTextStyle.regularTextStyle.copyWith(color: Colors.grey)),
                                                    ]
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 24,),
                                    Container(
                                      width: double.infinity,
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
                                          Navigator.of(context).push(new MaterialPageRoute(
                                          builder: (context) => TripInfo()));
                                        },
                                        materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                        child: Text(
                                          "Call Driver",
                                          style: CustomTextStyle.mediumTextStyle
                                              .copyWith(color: Colors.white),
                                        ),
                                        color: Colors.tealAccent.shade700,
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
                                children: <Widget>[
                                  Container(
                                    child: Icon(
                                      Icons.my_location,
                                      color: Colors.black,
                                    ),
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(color: Colors.grey.shade100,offset: Offset(1, 1),blurRadius: 8,spreadRadius: 1)
                                        ],
                                        color: Colors.white, shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.info_outline,
                                      color: Colors.black,
                                    ),
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(color: Colors.grey.shade100,offset: Offset(1, 1),blurRadius: 8,spreadRadius: 1)
                                        ],
                                        color: Colors.white, shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.end,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
