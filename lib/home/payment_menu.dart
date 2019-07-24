import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dialog/payment_dialog.dart';


class PaymentMenu extends StatelessWidget {

  var _ahmedabad = LatLng(23.0225, 72.5714);
  Set<Marker> markers = new Set();
  GoogleMapController mapController;
  void _onMapCreated(GoogleMapController mapController) {
    this.mapController = mapController;
  }

  addMarker(){
    markers.add(Marker(
        markerId: MarkerId("ahmedabad"),
        position: _ahmedabad,
        infoWindow: InfoWindow(title: "Title", snippet: "Content"),));
  }
  @override
  Widget build(BuildContext context) {
    addMarker();
    return Scaffold(
      body: Container(
        key: Key("ContainerPaymentMenu"),
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
            PaymentDialog()
          ],
        ),
      )
    );
  }
}
