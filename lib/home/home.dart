import 'package:flutter/material.dart';
import 'package:flutter_cab/home/pickup_user.dart';
import 'package:flutter_cab/menu/menu.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _ahmedabad = LatLng(23.0225, 72.5714);
  Set<Marker> markers = new Set();

  GoogleMapController mapController;
  BitmapDescriptor bitmapDescriptor;

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
        icon: bitmapDescriptor));
  }

  void _onMapCreated(GoogleMapController mapController) {
    this.mapController = mapController;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Builder(
          builder: (context) {
            return Container(
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
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: IconButton(
                              icon: Icon(Icons.menu), onPressed: () {
                                showDialog(context: context,builder: (context){
                                  return Menu();
                                });
                          }),
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
                           alignment: Alignment.centerRight,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: <Widget>[
                               Container(
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)),
                                   boxShadow: [
                                     BoxShadow(color: Colors.grey.shade400,blurRadius: 20,offset: Offset(-6, -10)),
                                     BoxShadow(color: Colors.grey.shade400,blurRadius: 20,offset: Offset(-6, 10))
                                   ]
                                 ),
                                 child: Card(
                                   elevation: 1,
                                   margin: EdgeInsets.all(0),
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8))),
                                   child: Container(
                                     margin: EdgeInsets.all(24),
                                     child: Column(
                                       children: <Widget>[
                                         Text("Car",style: CustomTextStyle.mediumTextStyle,),
                                         SizedBox(height: 2,),
                                         Image(image: AssetImage("images/car.png"),),
                                         SizedBox(height: 12,),
                                         Text("Budget",style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.grey),),
                                         SizedBox(height: 2,),
                                         Image(image: AssetImage("images/hatchback.png"),),
                                         SizedBox(height: 12,),
                                         Text("City",style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.grey),),
                                         SizedBox(height: 2,),
                                         Image(image: AssetImage("images/city.png"),),
                                         SizedBox(height: 12,),
                                         Text("Tuk",style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.grey),),
                                         SizedBox(height: 2,),
                                         Image(image: AssetImage("images/tuk.png"),),
                                         SizedBox(height: 12,),
                                         Text("Van",style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.grey),),
                                         SizedBox(height: 2,),
                                         Image(image: AssetImage("images/van.png"),),
                                       ],
                                     ),
                                   ),
                                 ),
                               )
                             ],
                           ),
                        ),
                        flex: 100,
                      ),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("images/navigation.png"),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>PickupUser()));
                        },
                        child: Text(
                          "I'm Here!",
                          style: CustomTextStyle.regularTextStyle
                              .copyWith(color: Colors.brown.shade400),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 4),
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24))),
                      ),
                      SizedBox(
                        height: 20,
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
}
