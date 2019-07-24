import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

import '../fare_info.dart';
import 'package:flutter_cab/modal/CancelTrip.dart';

class CancelTripFeedback extends StatefulWidget {
  @override
  _CancelTripFeedbackState createState() => _CancelTripFeedbackState();
}

class _CancelTripFeedbackState extends State<CancelTripFeedback> {
  List<CancelTrip> listCancelReason = new List();

  int selectedPosition;

  @override
  void initState() {
    super.initState();
    createListOfReason();
  }

  createListOfReason() {
    listCancelReason.add(createCancelReason("Change my mind", false));
    listCancelReason.add(createCancelReason("Driver is late", false));
    listCancelReason.add(createCancelReason("I got lift", false));
    listCancelReason.add(createCancelReason("Driver too far", false));
    listCancelReason.add(createCancelReason("Driver ask to cancel", false));
    listCancelReason.add(createCancelReason("Other", false));
  }

  createCancelReason(String title, bool isSelected) {
    return new CancelTrip(title, isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16))),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade50,
                              blurRadius: 10,
                              offset: Offset(0, 1)),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("images/ic_logo.png"),
                          )),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          child: Text(
                            "Cancel Request",
                            style: CustomTextStyle.boldTextStyle
                                .copyWith(fontSize: 16),
                          ),
                          margin: EdgeInsets.only(left: 20),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ListView.builder(
                          key: Key("ListMenu"),
                          shrinkWrap: true,
                          primary: true,
                          itemBuilder: (context, position) {
                            return createMenuListItemWidget(position);
                          },
                          itemCount: listCancelReason.length,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    )),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 50,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>FareInfo()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              side: BorderSide(
                                  color: Colors.grey.shade400, width: 1)),
                          color: Colors.white,
                          child: Text(
                            "Submit",
                            style: CustomTextStyle.boldTextStyle
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: Container(
                        margin: EdgeInsets.only(left: 4, right: 16),
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              side: BorderSide(
                                  color: Colors.grey.shade400, width: 1)),
                          color: Colors.white,
                          child: Text(
                            "Cancel",
                            style: CustomTextStyle.boldTextStyle
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  createMenuListItemWidget(int position) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPosition = position;
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(listCancelReason[position].title),
              margin: EdgeInsets.only(left: 12),
            ),
            Container(
              width: 20,
              height: 20,
              child: Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: selectedPosition == position
                      ? Colors.tealAccent.shade400
                      : Colors.transparent,
                  shape: BoxShape.circle),
            )
          ],
        ),
      ),
    );
  }
}
