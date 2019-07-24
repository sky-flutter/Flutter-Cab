import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

class NewsOffers extends StatefulWidget {
  @override
  _NewsOffersState createState() => _NewsOffersState();
}

class _NewsOffersState extends State<NewsOffers> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "News and Offers",
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
                        "News",
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
                        "Offers",
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
                        "Promotion",
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
                  if (position == 0) {
                    return createDateHeader();
                  } else {
                    return createTripListItem(position);
                  }
                },
                shrinkWrap: true,
                primary: false,
                itemCount: 2)
          ],
        ),
      ),
    );
  }

  createDateHeader() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 16),
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
      child: Card(
        shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(8)),
        margin: EdgeInsets.only(left: 14,right: 14),
        color: Colors.amber,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(12),
                    height: 100,
                    width: 100,
                    child: Image(image: AssetImage("images/ic_logo.png")),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "USD ",
                              style: CustomTextStyle.regularTextStyle
                                  .copyWith(fontSize: 12)),
                          TextSpan(
                              text: "400.00",
                              style: CustomTextStyle.boldTextStyle
                                  .copyWith(fontSize: 24))
                        ])),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "CASH BACK",
                        style: CustomTextStyle.mediumTextStyle
                            .copyWith(color: Colors.brown),
                      )
                    ],
                  )
                ],
              ),
              Container(
                child: Text(
                  "Get Your Cash Back",
                  style: CustomTextStyle.boldTextStyle,
                ),
                margin: EdgeInsets.only(left: 16),
              ),
              Container(
                child: Text(
                  "Get 25% CASH BACK on the first Rs. 400 of your trip value\ntill the 31st October! T&C apply",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: Colors.brown, fontSize: 12),
                ),
                margin: EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
