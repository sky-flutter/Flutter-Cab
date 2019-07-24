import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

import 'connect_social_account.dart';
import 'login_password.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var selectedItem;
  TextEditingController _mobileNumberController = new TextEditingController();

  bool isTextWritten = false;

  var selectedValue = "+91";

  createCountryCodeList() {
    List<DropdownMenuItem<String>> countryCodeList = new List();
    countryCodeList.add(createDropdownItem("+91"));
    countryCodeList.add(createDropdownItem("+92"));
    countryCodeList.add(createDropdownItem("+93"));
    countryCodeList.add(createDropdownItem("+94"));
    countryCodeList.add(createDropdownItem("+95"));
    countryCodeList.add(createDropdownItem("+96"));
    countryCodeList.add(createDropdownItem("+97"));
    return countryCodeList;
  }

  createDropdownItem(String code) {
    return DropdownMenuItem(
      value: code,
      child: Text(code),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Builder(
            builder: (context) {
              return Card(
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
                          "Ride with Kangaroo Cabs",
                          style: CustomTextStyle.regularTextStyle,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, top: 4),
                        child: Text(
                          "Enter your mobile number to Login or Register",
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
                            Container(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  border:
                                      Border.all(color: Colors.grey.shade400)),
                              child: DropdownButton(
                                items: createCountryCodeList(),
                                onChanged: (change) {
                                  setState(() {
                                    this.selectedValue = change;
                                  });
                                },
                                value: selectedValue,
                                isDense: true,
                                underline: Container(),
                              ),
                            ),
                            SizedBox(
                              width: 8,
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
                                            left: 8,
                                            right: 32,
                                            top: 6,
                                            bottom: 6),
                                        hintText: "Mobile Number",
                                        hasFloatingPlaceholder: true,
                                        hintStyle: CustomTextStyle
                                            .regularTextStyle
                                            .copyWith(
                                                color: Colors.grey, fontSize: 12),
                                        labelStyle: CustomTextStyle
                                            .regularTextStyle
                                            .copyWith(
                                                color: Colors.black,
                                                fontSize: 12),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>CreateSocialAccount()));
                            },
                            child: Container(
                              child: Text(
                                "Or connect with social account",
                                style: CustomTextStyle.mediumTextStyle.copyWith(
                                    color: Colors.grey.shade600, fontSize: 12),
                              ),
                              margin: EdgeInsets.only(left: 18),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (context) => LoginPassword()));
                            },
                            child: Container(
                              width: 40,
                              margin: EdgeInsets.only(right: 10),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.amber, shape: BoxShape.circle),
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
              );
            },
          ),
        ),
      ),
    );
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
        child: Container(),
      );
    }
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.white, width: 1));
}
