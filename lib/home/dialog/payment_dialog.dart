import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

import '../../add_card.dart';

class PaymentDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.2),
      alignment: Alignment.topCenter,
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16))),
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              ),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.keyboard_backspace),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.black,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      alignment: Alignment.center,
                      child: Text(
                        "Payment",
                        style: CustomTextStyle.mediumTextStyle,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage("images/payments/cash.png"),
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text("Cash",
                                style: CustomTextStyle.regularTextStyle
                                    .copyWith(fontSize: 12))
                          ],
                        ),
                        flex: 32,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Container(
                          width: 1,
                          height: 30,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=>AddCard()));
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage("images/payments/card.png"),
                                  height: 40,
                                  width: 40,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text("Card",
                                    style:
                                    CustomTextStyle.regularTextStyle.copyWith(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        flex: 32,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Container(
                          width: 1,
                          height: 30,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage("images/payments/points.png"),
                              height: 40,
                              width: 40,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text("Points",
                                style:
                                    CustomTextStyle.regularTextStyle.copyWith(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                        flex: 32,
                      )
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
