import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

class BookLaterDatePicker extends StatefulWidget {
  @override
  _BookLaterDatePickerState createState() => _BookLaterDatePickerState();
}

class _BookLaterDatePickerState extends State<BookLaterDatePicker> {
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
                              "Book Later",
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
                      key: Key("ContainerDate"),
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Date : ",
                              style: CustomTextStyle.mediumTextStyle
                                  .copyWith(color: Colors.black, fontSize: 14)),
                          TextSpan(
                              text: "Sunday October 7",
                              style: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.black, fontSize: 14))
                        ]),
                      ),
                    ),
                    Container(
                      key: Key("ContainerTime"),
                      margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Time : ",
                              style: CustomTextStyle.mediumTextStyle
                                  .copyWith(color: Colors.black, fontSize: 14)),
                          TextSpan(
                              text: "09:00 AM",
                              style: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.black, fontSize: 14))
                        ]),
                      ),
                    ),
                    Container(
                      key: Key("ContainerLine"),
                      margin: EdgeInsets.only(right: 16, left: 16, top: 12),
                      width: double.infinity,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: buildDatePicker(),
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

  DateTime date = DateTime.now();

  buildDatePicker() {
    return CupertinoDatePicker(
      mode: CupertinoDatePickerMode.dateAndTime,
      initialDateTime: date,
      onDateTimeChanged: (DateTime newDateTime) {
        setState(() => date = newDateTime);
      },
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
