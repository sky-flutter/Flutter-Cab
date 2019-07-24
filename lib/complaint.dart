import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

import 'package:flutter_cab/modal/CancelTrip.dart';
import 'package:flutter_cab/write_complaint.dart';

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  List<CancelTrip> listCancelReason = new List();

  int selectedPosition;

  @override
  void initState() {
    super.initState();
    createComplaintReason();
  }

  createComplaintReason() {
    listCancelReason.add(createComplain("I lost an item", false));
    listCancelReason.add(createComplain("Bad driver behavior", false));
    listCancelReason.add(createComplain("I would like a refund", false));
    listCancelReason.add(createComplain("Different driver/vehicle", false));
    listCancelReason.add(createComplain("Other", false));
  }

  createComplain(String title, bool isSelected) {
    return new CancelTrip(title, isSelected);
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
                          "Comaplint",
                          key: Key("TextComplaintLabel"),
                          style: CustomTextStyle.boldTextStyle
                              .copyWith(fontSize: 16),
                        ),
                        margin: EdgeInsets.only(left: 20),
                      ),
                      SizedBox(
                        key: Key("SizedBox_16"),
                        height: 16,
                      ),
                      ListView.builder(
                        key: Key("ListMenu"),
                        shrinkWrap: true,
                        primary: true,
                        itemBuilder: (context, position) {
                          return createMenuListItemWidget(position);
                        },
                        itemCount: listCancelReason.length,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  createMenuListItemWidget(int position) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>WriteComplaint()));
      },
      child: Container(
        key: Key("ContainerListItem"),
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
        child: Row(
          key: Key("RowListItem"),
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              key: Key("ContainerListTitle"),
              child: Text(listCancelReason[position].title),
              margin: EdgeInsets.only(left: 12),
            ),
            Container(
              key: Key("ContainerNextIcon"),
              width: 20,
              height: 20,
              child: Icon(
                Icons.navigate_next,
                size: 16,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
