import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';
class RateCard extends StatefulWidget {
  @override
  _RateCardState createState() => _RateCardState();
}

class _RateCardState extends State<RateCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          "Rate Card",
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
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              color: Colors.amber,
              height: 130,
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
                              .copyWith(color: Colors.brown.withOpacity(0.5)),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Image(
                          image: AssetImage("images/hatchback.png"),
                          color: Colors.brown.withOpacity(0.5),
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
                              .copyWith(color: Colors.brown.withOpacity(0.5)),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Image(
                          image: AssetImage("images/city.png"),
                            color: Colors.brown.withOpacity(0.5)
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
                              .copyWith(color: Colors.brown.withOpacity(0.5)),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Image(
                          image: AssetImage("images/tuk.png"),
                            color: Colors.brown.withOpacity(0.5)
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
                              .copyWith(color: Colors.brown.withOpacity(0.5)),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Image(
                          image: AssetImage("images/van.png"),
                            color: Colors.brown.withOpacity(0.5)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80,left: 16,right: 16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    offset: Offset(1,40)
                  )
                ]
              ),
              width: double.infinity,
              height: 140,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:16,top: 16),
                      child: Text("Car",style: CustomTextStyle.mediumTextStyle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top: 2),
                      child: Text("Toyota Prius / Axio(Hybrid)",style: CustomTextStyle.regularTextStyle.copyWith(fontSize: 12,color: Colors.grey),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16,top:16),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Min Fare (First 1 Km)",
                              style: CustomTextStyle.mediumTextStyle
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                          Container(
                            child: Text(
                              "USD 80.00",
                              style: CustomTextStyle.mediumTextStyle
                                  .copyWith(
                                  color: Colors.grey,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16,top: 6),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "After 1 Km (Per Km)",
                              style: CustomTextStyle.mediumTextStyle
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                          Container(
                            child: Text(
                              "USD 5.00",
                              style: CustomTextStyle.mediumTextStyle
                                  .copyWith(
                                  color: Colors.grey,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16,top: 6),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Waiting Time (Per 1 Hour)",
                              style: CustomTextStyle.mediumTextStyle
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                          Container(

                            child: Text(
                              "USD 300.00",
                              style: CustomTextStyle.mediumTextStyle
                                  .copyWith(
                                  color: Colors.grey,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
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
