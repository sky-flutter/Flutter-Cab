import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';
import 'package:flutter_cab/utils/DottedLine.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            Stack(
              key: Key("AppBar"),
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
                      "Profile",
                      style: CustomTextStyle.mediumTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "CONTACT DETAILS",
                      style: CustomTextStyle.mediumTextStyle
                          .copyWith(color: Colors.grey),
                    ),
                    margin: EdgeInsets.only(left: 16, top: 12),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 12),
                    child: Text(
                      "Name",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text("Ishan Madushka",
                            style: CustomTextStyle.mediumTextStyle),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(Icons.navigate_next, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 12),
                    child: Text(
                      "Email",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 4),
                    child: Text("ish.madushka@gmail.com",
                        style: CustomTextStyle.mediumTextStyle),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      "Mobile Number",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text("+94 71 87 86 729",
                            style: CustomTextStyle.mediumTextStyle),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                  DottedLine(16,16,4),
                  Container(
                    child: Text(
                      "SECURITY DETAILS",
                      style: CustomTextStyle.mediumTextStyle
                          .copyWith(color: Colors.grey),
                    ),
                    margin: EdgeInsets.only(left: 16, top: 12),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 12),
                    child: Text(
                      "Password",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text("Change Password",
                            style: CustomTextStyle.mediumTextStyle),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(Icons.navigate_next, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 12),
                    child: Text(
                      "Security Question",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text("Change Security Question",
                            style: CustomTextStyle.mediumTextStyle),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(Icons.navigate_next, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  DottedLine(16,16,4),
                  Container(
                    child: Text(
                      "LANGUAGE",
                      style: CustomTextStyle.mediumTextStyle
                          .copyWith(color: Colors.grey),
                    ),
                    margin: EdgeInsets.only(left: 16, top: 12),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 16, top: 12),
                    child: Text(
                      "Select Language",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text("English",
                            style: CustomTextStyle.mediumTextStyle),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(Icons.navigate_next, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 12),
                    child: Text(
                      "Logout",
                      style: CustomTextStyle.mediumTextStyle
                          .copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
