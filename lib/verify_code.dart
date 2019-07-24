import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

class VerifyCode extends StatefulWidget {
  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
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
                    "Are you new to Kangaaroo Cabs?",
                    style: CustomTextStyle.mediumTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, top: 4),
                  child: Text(
                    "Enter your password ride with Kangaroo cabs",
                    style: CustomTextStyle.regularTextStyle.copyWith(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    "+94 71234 56780",
                    style: CustomTextStyle.boldTextStyle.copyWith(
                      color: Colors.redAccent,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Container(
                  margin: EdgeInsets.only(right: 14, left: 14),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 4),
                          child: TextField(
                            decoration: InputDecoration(
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 32, top: 6, bottom: 6),
                              hintText: "",
                              hintStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.grey, fontSize: 12),
                              labelStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.black, fontSize: 12),
                            ),
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        flex: 25,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 4),
                          child: TextField(
                            decoration: InputDecoration(
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 32, top: 6, bottom: 6),
                              hintText: "",
                              hintStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.grey, fontSize: 12),
                              labelStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.black, fontSize: 12),
                            ),
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        flex: 25,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 4),
                          child: TextField(
                            decoration: InputDecoration(
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 32, top: 6, bottom: 6),
                              hintText: "",
                              hintStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.grey, fontSize: 12),
                              labelStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.black, fontSize: 12),
                            ),
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        flex: 25,
                      ),
                      Expanded(
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 32, top: 6, bottom: 6),
                              hintText: "",
                              hintStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.grey, fontSize: 12),
                              labelStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.black, fontSize: 12),
                            ),
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        flex: 25,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Wrap(
                          children: <Widget>[
                            Text("Resend code in : ",
                                style: CustomTextStyle.regularTextStyle
                                    .copyWith(color: Colors.grey)),
                            Text("00:59",
                                style: CustomTextStyle.blackTextStyle),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 18),
                      ),
                      flex: 100,
                    ),
                    Container(
                      width: 40,
                      margin: EdgeInsets.only(right: 10),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
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
      borderSide: BorderSide(color: Colors.grey.shade400, width: 1));
}
