import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';
import 'package:flutter_cab/verify_code.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                      "Enter your email address",
                      style: CustomTextStyle.regularTextStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 4),
                    child: Text(
                      "Enter your email address to get the password reset code",
                      style: CustomTextStyle.regularTextStyle.copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 14),
                  Container(
                    margin: EdgeInsets.only(right: 14, left: 14),
                    child: Row(
                      children: <Widget>[
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
                                    hintText: "Enter your email address",
                                    hasFloatingPlaceholder: true,
                                    hintStyle: CustomTextStyle.regularTextStyle
                                        .copyWith(
                                        color: Colors.grey, fontSize: 12),
                                    labelStyle: CustomTextStyle.regularTextStyle
                                        .copyWith(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),

                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(4)),
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade400)),
                          ),
                          flex: 100,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>VerifyCode()));
                        },
                        child: Container(
                          width: 40,
                          margin: EdgeInsets.only(right: 10),
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
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
        ),
      ),
    );
  }



  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.white, width: 1));
}
