import 'package:flutter/material.dart';
import 'package:flutter_cab/modal/favorite_place.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

import 'book_cab_without_destination.dart';

class DropOffUser extends StatefulWidget {
  @override
  _DropOffUserState createState() => _DropOffUserState();
}

class _DropOffUserState extends State<DropOffUser> {
  var selectedItem;
  TextEditingController _mobileNumberController = new TextEditingController();
  List<FavoritePlace> listFavoritePlace = new List();
  bool isTextWritten = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createFavoritePlaceList();
  }

  createFavoritePlaceList() {
    listFavoritePlace.add(
        createFavorite("Creative Software - Office", "No.29 Deal PI, Colombo"));
    listFavoritePlace.add(
        createFavorite("Katunayake Airport", "No.65 Walukarama Rd, Colombo"));
    listFavoritePlace.add(createFavorite("Home", "Palanwatta, Pannipitiya"));
    return listFavoritePlace;
  }

  createFavorite(String title, String subtitle) {
    return new FavoritePlace(title, subtitle);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey.shade50,
        body: ListView(
          children: <Widget>[
            Card(
              elevation: 4,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16))),
              margin: EdgeInsets.only(left: 0, right: 0, bottom: 4),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 20,
                          offset: Offset(00, 10)),
                    ]),
                width: double.infinity,
                padding: EdgeInsets.only(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: Text(
                                "Drop off Location",
                                style: CustomTextStyle.mediumTextStyle
                                    .copyWith(color: Colors.red.shade400),
                              ),
                              margin: EdgeInsets.only(left: 16)),
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(right: 04),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Text(
                                "Skip",
                                style: CustomTextStyle.mediumTextStyle,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                          ),
                          Expanded(
                            child: Container(
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                      border: border,
                                      enabledBorder: border,
                                      focusedBorder: border,
                                      contentPadding: EdgeInsets.only(
                                          left: 8, right: 32, top: 6, bottom: 6),
                                      hintText: "Where are you going?",
                                      hasFloatingPlaceholder: true,
                                      hintStyle: CustomTextStyle.regularTextStyle
                                          .copyWith(
                                          color: Colors.grey, fontSize: 12),
                                      labelStyle: CustomTextStyle.regularTextStyle
                                          .copyWith(
                                          color: Colors.black, fontSize: 13),
                                    ),
                                    onChanged: (value) {
                                      if (value.trim().length > 0) {
                                        setState(() {
                                          this.isTextWritten = true;
                                        });
                                      } else {
                                        this.isTextWritten = false;
                                      }
                                    },
                                    controller: _mobileNumberController,
                                    keyboardType: TextInputType.phone,
                                  ),
                                  createClearText()
                                ],
                              ),
                            ),
                            flex: 100,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border:
                          Border.all(width: 1, color: Colors.grey.shade400)),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 18,
                              ),
                              Image(
                                image: AssetImage("images/map-marker.png"),
                                height: 16,
                                width: 16,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                child: Text(
                                  "Tap to select from the map",
                                  style: CustomTextStyle.mediumTextStyle.copyWith(
                                      color: Colors.grey.shade600, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => BookWithoutDestination(this.isTextWritten)));
                          },
                          child: Container(
                            width: 40,
                            margin: EdgeInsets.only(right: 10),
                            height: 40,
                            decoration: BoxDecoration(
                                color: this.isTextWritten
                                    ? Colors.amber
                                    : Colors.grey,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Favorite places",
                style: CustomTextStyle.mediumTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ListView.builder(
              itemBuilder: (context, position) {
                return createFavoriteListItem(listFavoritePlace[position]);
              },
              itemCount: listFavoritePlace.length,
              shrinkWrap: true,
              primary: false,
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Recently visited places",
                style: CustomTextStyle.mediumTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ListView.builder(
              itemBuilder: (context, position) {
                return createRecentlyPlaceListItem(listFavoritePlace[position]);
              },
              itemCount: listFavoritePlace.length,
              shrinkWrap: true,
              primary: false,
            )
          ],
        ),
      ),
    );
  }

  void showDeleteBottomSheet(BuildContext context) {
   _scaffoldKey.currentState.showBottomSheet((BuildContext context){
     return Container(
       height: 120,
       decoration: BoxDecoration(
          color: Colors.white,
           borderRadius: BorderRadius.only(
               topLeft: Radius.circular(16),
               topRight: Radius.circular(16))),
       child: Column(
         children: <Widget>[
           SizedBox(
             height: 16,
           ),
           Text(
             "Delete Favorite",
             style: CustomTextStyle.mediumTextStyle,
           ),
           SizedBox(
             height: 8,
           ),
           Text(
             "Are you sure you want to delete?",
             style: CustomTextStyle.regularTextStyle
                 .copyWith(color: Colors.grey, fontSize: 12),
           ),
           SizedBox(
             height: 10,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               SizedBox(
                 width: 8,
               ),
               Expanded(
                 child: Container(
                   child: RaisedButton(
                     onPressed: () {},
                     child: Text(
                       "Yes",
                       style: CustomTextStyle.mediumTextStyle,
                     ),
                     color: Colors.white,
                     shape: RoundedRectangleBorder(
                         borderRadius:
                         BorderRadius.all(Radius.circular(100)),
                         side: BorderSide(color: Colors.grey, width: 1)),
                   ),
                 ),
                 flex: 50,
               ),
               SizedBox(
                 width: 8,
               ),
               Expanded(
                 child: Container(
                   child: RaisedButton(
                     onPressed: () {},
                     child: Text(
                       "No",
                       style: CustomTextStyle.mediumTextStyle,
                     ),
                     color: Colors.white,
                     shape: RoundedRectangleBorder(
                         borderRadius:
                         BorderRadius.all(Radius.circular(100)),
                         side: BorderSide(color: Colors.grey, width: 1)),
                   ),
                 ),
                 flex: 50,
               ),
               SizedBox(
                 width: 8,
               ),
             ],
           )
         ],
       ),
     );
   });
  }

  createClearText() {
    if (isTextWritten) {
      return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            _mobileNumberController.clear();
            setState(() {
              isTextWritten = false;
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 8),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                color: Colors.grey.shade400, shape: BoxShape.circle),
            child: Icon(
              Icons.close,
              size: 14,
              color: Colors.white,
            ),
            alignment: Alignment.center,
          ),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.topRight,
        child: Text(""),
      );
    }
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.white, width: 1));

  createFavoriteListItem(FavoritePlace listFavoritePlace) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 8,
          ),
          Container(
            child: Icon(
              Icons.favorite,
              size: 20,
              color: Colors.greenAccent,
            ),
            margin: EdgeInsets.only(top: 4),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 4,
                ),
                Container(
                  child: Text(
                    listFavoritePlace.title,
                    style: CustomTextStyle.mediumTextStyle,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  child: Text(
                    listFavoritePlace.subtitle,
                    style: CustomTextStyle.mediumTextStyle
                        .copyWith(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ),
            flex: 100,
          ),
          GestureDetector(
            child: Container(
              child: Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
              margin: EdgeInsets.only(top: 4),
            ),
            onTap: () {
              showDeleteBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  createRecentlyPlaceListItem(FavoritePlace listFavoritePlace) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 8,
          ),
          Container(
            child: Icon(
              Icons.watch_later,
              size: 20,
              color: Colors.grey,
            ),
            margin: EdgeInsets.only(top: 4),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            child: Text(
              listFavoritePlace.subtitle,
              style: CustomTextStyle.mediumTextStyle
                  .copyWith(color: Colors.grey, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
