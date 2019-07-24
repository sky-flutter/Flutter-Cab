import 'package:flutter/material.dart';
import 'package:flutter_cab/home/home.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

import 'forgot_password.dart';

class EmergencyContacts extends StatefulWidget {
  @override
  _EmergencyContactsState createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {
  bool isTextWritten = false;

  TextEditingController _mobileNumberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  key: Key("ContainerHeader"),
                  margin: EdgeInsets.only(left: 16, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Emergency Contacts",
                          style: CustomTextStyle.mediumTextStyle,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
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
                                  hintText: "Add number",
                                  hasFloatingPlaceholder: false,
                                  hintStyle: CustomTextStyle.regularTextStyle
                                      .copyWith(
                                          color: Colors.grey, fontSize: 12),
                                  labelStyle: CustomTextStyle.regularTextStyle
                                      .copyWith(
                                          color: Colors.black, fontSize: 12),
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
                ),
                SizedBox(height: 16),
                Align(
                  child:  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => Home()));
                    },
                    child: Container(
                      width: 40,
                      margin: EdgeInsets.only(right: 10),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500, shape: BoxShape.circle),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  alignment: Alignment.topRight,
                ),
                SizedBox(height: 24),
              ],
            ),
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
