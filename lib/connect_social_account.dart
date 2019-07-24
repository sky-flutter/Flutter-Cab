import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomColors.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

class CreateSocialAccount extends StatefulWidget {
  @override
  _CreateSocialAccountState createState() => _CreateSocialAccountState();
}

class _CreateSocialAccountState extends State<CreateSocialAccount> {
  bool isTextWritten = false;

  TextEditingController _mobileNumberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Card(
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
                    BoxShadow(color: Colors.grey.shade50, blurRadius: 5),
                  ]),
              width: double.infinity,
              padding: EdgeInsets.only(top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 14),
                  Container(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("images/ic_logo.png"),
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(height: 14),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      "Social Account",
                      style: CustomTextStyle.mediumTextStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 4),
                    child: Text(
                      "Connect with social account",
                      style: CustomTextStyle.regularTextStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 16, left: 16),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Connect with Google Account",
                        style: CustomTextStyle.mediumTextStyle
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      color: CustomColors.COLOR_GOOGLE,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 16, left: 16),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Connect with Facebook Account",
                        style: CustomTextStyle.mediumTextStyle
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      color: CustomColors.COLOR_FACEBOOK,
                    ),
                  ),
                  SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  createClearText() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isTextWritten = !isTextWritten;
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 8),
          width: 20,
          height: 20,
          child: Icon(
            isTextWritten ? Icons.visibility : Icons.visibility_off,
            size: 20,
            color: Colors.grey,
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.white, width: 1));
}
