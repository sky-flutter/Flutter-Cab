import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  var selectedItem;
  TextEditingController _mobileNumberController = new TextEditingController();

  bool isTextWritten = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      key: Key("ContainerHeader"),
                      margin: EdgeInsets.only(left: 14, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Add Card",
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
                      margin: EdgeInsets.only(top: 8, right: 12, left: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: border.copyWith(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: border.copyWith(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: border.copyWith(
                              borderSide: BorderSide(color: Colors.grey)),
                          contentPadding: EdgeInsets.only(
                              left: 8, right: 32, top: 10, bottom: 10),
                          hintText: "Card Holder Name",
                          hasFloatingPlaceholder: true,
                          hintStyle: CustomTextStyle.regularTextStyle
                              .copyWith(color: Colors.grey, fontSize: 12),
                          labelStyle: CustomTextStyle.regularTextStyle
                              .copyWith(color: Colors.black, fontSize: 12),
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, right: 12, left: 12),
                      child:
                          Stack(alignment: Alignment.center, children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            border: border.copyWith(
                                borderSide: BorderSide(color: Colors.grey)),
                            enabledBorder: border.copyWith(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: border.copyWith(
                                borderSide: BorderSide(color: Colors.grey)),
                            contentPadding: EdgeInsets.only(
                                left: 8, right: 32, top: 10, bottom: 10),
                            hintText: "Card Number",
                            hasFloatingPlaceholder: true,
                            hintStyle: CustomTextStyle.regularTextStyle
                                .copyWith(color: Colors.grey, fontSize: 12),
                            labelStyle: CustomTextStyle.regularTextStyle
                                .copyWith(color: Colors.black, fontSize: 12),
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
                      ]),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: Container(
                          margin: EdgeInsets.only(top: 8, right: 8, left: 12),
                          child: TextField(
                            decoration: InputDecoration(
                              border: border.copyWith(
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: border.copyWith(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: border.copyWith(
                                  borderSide: BorderSide(color: Colors.grey)),
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 32, top: 10, bottom: 10),
                              hintText: "Month",
                              hasFloatingPlaceholder: true,
                              hintStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.grey, fontSize: 12),
                              labelStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.black, fontSize: 12),
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
                        ),flex: 30,),
                        Expanded(child: Container(
                          margin: EdgeInsets.only(top: 8, right:8),
                          child: TextField(
                            decoration: InputDecoration(
                              border: border.copyWith(
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: border.copyWith(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: border.copyWith(
                                  borderSide: BorderSide(color: Colors.grey)),
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 32, top: 10, bottom: 10),
                              hintText: "Year",
                              hasFloatingPlaceholder: true,
                              hintStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.grey, fontSize: 12),
                              labelStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.black, fontSize: 12),
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
                        ),flex: 30,),
                        Expanded(child: Container(
                          margin: EdgeInsets.only(top: 8, right: 12),
                          child: TextField(
                            decoration: InputDecoration(
                              border: border.copyWith(
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: border.copyWith(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: border.copyWith(
                                  borderSide: BorderSide(color: Colors.grey)),
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 32, top: 10, bottom: 10),
                              hintText: "CVV",
                              hasFloatingPlaceholder: true,
                              hintStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.grey, fontSize: 12),
                              labelStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.black, fontSize: 12),
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
                        ),flex: 40,)
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(top: 24, right: 16, bottom: 24),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.tealAccent.shade400),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  createClearText() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 8),
          width: 18,
          height: 18,
          child: Icon(
            Icons.camera_alt,
            size: 18,
            color: Colors.grey,
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.grey, width: 1));
}
