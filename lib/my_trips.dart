import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

class MyTrips extends StatefulWidget {
  @override
  _MyTripsState createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Trips",
          style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 33,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 0;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 14, left: 8, right: 8),
                      child: Text(
                        "Completed",
                        style: CustomTextStyle.mediumTextStyle.copyWith(
                            color:
                                selectedTab == 0 ? Colors.black : Colors.grey),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: 24,
                  color: Colors.grey.shade400,
                ),
                Expanded(
                  flex: 33,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 14, left: 8, right: 8),
                      child: Text(
                        "Up Comming",
                        style: CustomTextStyle.mediumTextStyle.copyWith(
                            color:
                                selectedTab == 1 ? Colors.black : Colors.grey),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: 24,
                  color: Colors.grey.shade400,
                ),
                Expanded(
                  flex: 33,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 2;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 14, left: 8, right: 8),
                      child: Text(
                        "Cancelled",
                        style: CustomTextStyle.mediumTextStyle.copyWith(
                            color:
                                selectedTab == 2 ? Colors.black : Colors.grey),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
            ListView.builder(
                itemBuilder: (context, position) {
                  if (position == 0 || position % 3 == 0) {
                    return createDateHeader();
                  } else {
                    return createTripListItem(position);
                  }
                },
                shrinkWrap: true,
                primary: false,
                itemCount:6)
          ],
        ),
      ),
    );
  }

  createDateHeader() {
    return Container(
      margin: EdgeInsets.only(left: 16,top: 16),
      child: Text(
        "MON 8 OCT 2018",
        style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.grey),
      ),
    );
  }

  createTripListItem(int position) {
    double bottomMargin = 0.0;
    if (position == 5) {
      bottomMargin = 16.0;
    }
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: bottomMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(top: 8, left: 16),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: AssetImage("images/driver.jpg")),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 1), blurRadius: 10)
                ]),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: Offset(4,0),
                      blurRadius: 10,
                    )
                  ]
              ),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  padding: EdgeInsets.all(12),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Nihal Perera",
                              style: CustomTextStyle.mediumTextStyle,
                            ),
                          ),
                          Container(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "USD",
                                  style: CustomTextStyle.regularTextStyle
                                      .copyWith(
                                          color: Colors.grey, fontSize: 12)),
                              TextSpan(
                                  text: " 860.00",
                                  style: CustomTextStyle.mediumTextStyle.copyWith(
                                      color: Colors.black, fontSize: 14))
                            ])),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      addressRow(Colors.tealAccent.shade700,
                          "R. A De Mel Mawatha", "07:35 PM"),
                      addressRow(Colors.redAccent.shade700,
                          "Piliyandala, Maharagama Road", "08:26 PM")
                    ],
                  ),
                ),
              ),
            ),
            flex: 100,
          )
        ],
      ),
    );
  }

  addressRow(Color color, String address, String strTime) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 10,
            width: 10,
            margin: EdgeInsets.only(top: 3),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Text(
                  address,
                  style: CustomTextStyle.boldTextStyle,
                ),
              ),
              Container(
                child: Text(
                  strTime,
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: Colors.grey, fontSize: 12),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
