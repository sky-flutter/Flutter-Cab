import 'package:flutter/material.dart';
import 'package:flutter_cab/home/cancel_trip_feedback.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cancel_trip.dart';
import 'dialog/payment_dialog.dart';
import 'dialog/promo_code_dialog.dart';

class BookWithoutDestination extends StatefulWidget {
  bool isTextWritten;

  BookWithoutDestination(this.isTextWritten);

  @override
  _BookWithoutDestinationState createState() =>
      _BookWithoutDestinationState(isTextWritten);
}

class _BookWithoutDestinationState extends State<BookWithoutDestination> {
  var _ahmedabad = LatLng(23.0225, 72.5714);
  var _lal_darwaja = LatLng(23.0264, 72.5819);
  Set<Marker> markers = new Set();

  GoogleMapController mapController;
  BitmapDescriptor bitmapDescriptor;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  bool isTextWritten;

  _BookWithoutDestinationState(this.isTextWritten);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), "images/map-marker.png")
        .then((bitmap) {
      bitmapDescriptor = bitmap;
    });
    markers.add(Marker(
        markerId: MarkerId("ahmedabad"),
        position: _ahmedabad,
        infoWindow: InfoWindow(title: "Title", snippet: "Content"),
        icon: bitmapDescriptor));

    if (isTextWritten) {
      markers.add(Marker(
          markerId: MarkerId("lal_darwaja"),
          position: _lal_darwaja,
          infoWindow: InfoWindow(title: "Title", snippet: "Content"),
          icon: bitmapDescriptor));
      WidgetsBinding.instance
          .addPostFrameCallback((_) => showFareEstimationBottomSheet());
    }
  }

  void _onMapCreated(GoogleMapController mapController) {
    this.mapController = mapController;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          dialogTheme: DialogTheme(backgroundColor: Colors.white),
          canvasColor: Colors.transparent,
          accentColor: Colors.amber),
      home: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: Builder(
          builder: (context) {
            return Container(
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                    key: Key("googleMap"),
                    initialCameraPosition:
                        CameraPosition(target: _ahmedabad, zoom: 14),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    markers: markers,
                    onMapCreated: _onMapCreated,
                  ),
                  Column(
                    key: Key("Cars"),
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 12, top: 24),
                          child: Image(
                            image: AssetImage("images/ic_close.png"),
                          ),
                        ),
                      ),
                      Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
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
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Stack(
                                key: Key("timer"),
                                children: <Widget>[
                                  Align(
                                    child: Container(
                                      key: Key("navigationKey"),
                                      width: 36,
                                      height: 36,
                                      margin: EdgeInsets.only(top: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.4),
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "images/navigation.png"),
                                          )),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      key: Key("timer"),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade400,
                                                blurRadius: 60,
                                                offset: Offset(-6, -10)),
                                            BoxShadow(
                                                color: Colors.grey.shade400,
                                                blurRadius: 60,
                                                offset: Offset(-6, 10))
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Card(
                                        elevation: 0,
                                        color: Colors.white,
                                        margin: EdgeInsets.only(
                                            bottom: 8, right: 16),
                                        child: Container(
                                          child: Image(
                                            image: AssetImage(
                                                "images/stopwatch.png"),
                                          ),
                                          margin: EdgeInsets.all(8),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        flex: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                        ),
                        child: Card(
                          elevation: 1,
                          color: Colors.white,
                          margin: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16))),
                          child: Container(
                            margin: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "Car",
                                      style: CustomTextStyle.mediumTextStyle,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Image(
                                      image: AssetImage("images/car.png"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "Budget",
                                      style: CustomTextStyle.mediumTextStyle
                                          .copyWith(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Image(
                                      image: AssetImage("images/hatchback.png"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "City",
                                      style: CustomTextStyle.mediumTextStyle
                                          .copyWith(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Image(
                                      image: AssetImage("images/city.png"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "Tuk",
                                      style: CustomTextStyle.mediumTextStyle
                                          .copyWith(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Image(
                                      image: AssetImage("images/tuk.png"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "Van",
                                      style: CustomTextStyle.mediumTextStyle
                                          .copyWith(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Image(
                                      image: AssetImage("images/van.png"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      getDestinationView(),
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
                                builder: (context) => CancelTrip()));
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Text(
                            "Book Now",
                            style: CustomTextStyle.mediumTextStyle
                                .copyWith(color: Colors.brown),
                          ),
                          color: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                          padding: EdgeInsets.all(16),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  getDestinationView() {
    return this.isTextWritten
        ? Container(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            width: double.infinity,
            color: Colors.grey.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "USD 550-600",
                  style: CustomTextStyle.regularTextStyle,
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Note: ",
                        style: CustomTextStyle.mediumTextStyle
                            .copyWith(color: Colors.grey, fontSize: 12),
                      ),
                      Expanded(
                        child: Text(
                          "This is an approximate estimate, Actual cost may be different due to traffic and waiting time.",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.regularTextStyle
                              .copyWith(color: Colors.grey, fontSize: 12),
                        ),
                        flex: 100,
                      )
                    ],
                  ),
                ),
                /*RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Note: ",
                      style: CustomTextStyle.mediumTextStyle
                          .copyWith(color: Colors.grey, fontSize: 12),
                    ),
                    TextSpan(
                      text:
                      "This is an approximate estimate, Actual cost may be different due to traffic and waiting time.",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey, fontSize: 12,),
                    )
                  ],
                  ),
                )*/
              ],
            ),
          )
        : GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              width: double.infinity,
              color: Colors.grey.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.info_outline,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "To get estimation please enter the drop off location",
                    style: CustomTextStyle.regularTextStyle
                        .copyWith(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ),
          );
  }

  showFareEstimationBottomSheet() {
    return scaffoldKey.currentState.showBottomSheet((BuildContext context) {
      return Container(
        height: 230,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16, left: 8, right: 8),
              child: Text(
                "Fare Breakdown",
                style: CustomTextStyle.mediumTextStyle,
              ),
            ),
            Container(
              child: Text(
                "Below mentioned fare rates may change according to surcharge and adjustments.",
                style: CustomTextStyle.regularTextStyle
                    .copyWith(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.symmetric(horizontal: 36, vertical: 2),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8, top: 8, bottom: 8),
                    child: Text(
                      "Min Fare (First 1 Km)",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8, top: 8, bottom: 8),
                    child: Text(
                      "USD 80.00",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8, top: 8, bottom: 8),
                    child: Text(
                      "After 1 Km (Per Km)",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8, top: 8, bottom: 8),
                    child: Text(
                      "USD 5.00",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8, top: 8, bottom: 8),
                    child: Text(
                      "Waiting Time (Per 1 Hour)",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8, top: 8, bottom: 8),
                    child: Text(
                      "USD 300.00",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0))),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Text(
                  "Close",
                  style: CustomTextStyle.regularTextStyle,
                ),
                textColor: Colors.black,
                color: Colors.grey.shade200,
              ),
            )
          ],
        ),
      );
    });
  }
}
