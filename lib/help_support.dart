import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

class HelpSupport extends StatefulWidget {
  @override
  _HelpSupportState createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Help and Support",
          style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 18,right: 18),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("About",style: CustomTextStyle.boldTextStyle.copyWith(fontSize: 12),),
                    SizedBox(height: 4,),
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",style: CustomTextStyle.regularTextStyle.copyWith(fontSize: 12,color: Colors.grey.shade600),),
                    SizedBox(height:24,),
                    Text("Dear Passenger,",style: CustomTextStyle.boldTextStyle.copyWith(fontSize: 12),),
                    SizedBox(height: 4,),
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",style: CustomTextStyle.regularTextStyle.copyWith(fontSize: 12,color: Colors.grey.shade600),),
                    SizedBox(height:24,),
                    Text("Kangaroo Cabs HQ,",style: CustomTextStyle.boldTextStyle.copyWith(fontSize: 12),),
                    SizedBox(height: 4,),
                    Text("No. 485 7/A, Gunawardena Mawatha,Wijerama,\nNugegoda, Sri Lanka.",style: CustomTextStyle.regularTextStyle.copyWith(fontSize: 12,color: Colors.grey.shade600),),
                    SizedBox(height:24,),
                    Text("Terms And Conditions",style: CustomTextStyle.regularTextStyle.copyWith(fontSize: 12,color: Colors.black),),
                    SizedBox(height:8,),
                    Text("Version  - 2.0",style: CustomTextStyle.regularTextStyle.copyWith(fontSize: 12,color: Colors.grey),),
                  ],
                ),
              ),
              flex: 70,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 16,left: 16,top: 8,bottom: 8),
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(6),
                          child: Image(
                              image: AssetImage("images/ic_facebook.png"),
                              width: 24,
                              height: 24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          child: Image(
                              image: AssetImage("images/ic_twitter.png"),
                              width: 24,
                              height: 24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          child: Image(
                              image: AssetImage("images/ic_instagram.png"),
                              width: 24,
                              height: 24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 12,bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side:  BorderSide(color: Colors.tealAccent.shade700,width: 1)
                        ),
                        child: Text("Call Customer Support",style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.tealAccent.shade700),),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 12,bottom: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side:  BorderSide(color: Colors.yellowAccent.shade400,width: 1)
                        ),
                        child: Text("Email Us Your Ideas",style: CustomTextStyle.mediumTextStyle.copyWith(color: Colors.amberAccent.shade400),),
                      ),
                    )
                  ],
                ),
              ),
              flex: 30,
            )
          ],
        ),
      ),
    );
  }
}
