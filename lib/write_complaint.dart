import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

class WriteComplaint extends StatefulWidget {
  @override
  _WriteComplaintState createState() => _WriteComplaintState();
}

class _WriteComplaintState extends State<WriteComplaint> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        key: Key("ContainerMain"),
        child: Column(
          key: Key("ColumnMain"),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              key: Key("CardTop"),
              elevation: 4,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16))),
              child: Container(
                  key: Key("ContainerListItem"),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade50,
                            blurRadius: 10,
                            offset: Offset(0, 1)),
                      ]),
                  child: Column(
                    key: Key("ColumnList"),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        key: Key("SizedBox_24"),
                        height: 24,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            key: Key("ContainerLogo"),
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("images/ic_logo.png"),
                            )),
                          ),
                          Align(
                            key: Key("AlignBack"),
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.keyboard_backspace),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        key: Key("SizedBox_24_1"),
                        height: 24,
                      ),
                      Container(
                        key: Key("ContainerComplaintLabel"),
                        child: Text(
                          "Enter a description",
                          key: Key("TextComplaintLabel"),
                          style: CustomTextStyle.boldTextStyle
                              .copyWith(fontSize: 16),
                        ),
                        margin: EdgeInsets.only(left: 20),
                      ),
                      buildSizedBox_16(),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        key: Key("ContainerDescBox"),
                        child: TextFormField(
                          key: Key("TextFormFieldDescription"),
                          keyboardType: TextInputType.multiline,
                          textAlign: TextAlign.start,
                          minLines: 3,
                          maxLines: 3,
                          decoration: InputDecoration(
                              hintStyle: CustomTextStyle.regularTextStyle
                                  .copyWith(color: Colors.grey),
                              border: border,
                              hasFloatingPlaceholder: false,
                              enabledBorder: border,
                              focusedBorder: border.copyWith(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade700, width: 1))),
                        ),
                      ),
                      buildSizedBox_16(),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            /*Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => LoginPassword()));*/
                          },
                          child: Container(
                            width: 40,
                            margin: EdgeInsets.only(right: 16),
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      buildSizedBox_16(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox_16() {
    return SizedBox(
      height: 16,
    );
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1));
}
