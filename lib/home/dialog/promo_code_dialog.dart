import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

class PromoCodeDialog extends StatefulWidget {
  @override
  _PromoCodeDialogState createState() => _PromoCodeDialogState();
}

class _PromoCodeDialogState extends State<PromoCodeDialog> {

  TextEditingController _mobileNumberController = new TextEditingController();

  bool isTextWritten = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16))),
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade50, blurRadius: 1,offset: Offset(0, 1)),
              ]
          ),
          height: 200,
          child: Column(
            children: <Widget>[
              Container(
               margin: EdgeInsets.only(left: 14,top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Promo Code",
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
                margin: EdgeInsets.only(left: 12,right: 12, top: 8),
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
                            top: 10,
                            bottom: 10),
                        hintText: "Promo Code",
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
              Expanded(child: Container(
                margin: EdgeInsets.only(bottom: 16,left: 14,right: 12),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center ,
                  children: <Widget>[
                    Container(
                      child: Text("Please enter your promo code\nand save it on your ride",softWrap: true,style: CustomTextStyle.regularTextStyle.copyWith(color: Colors.grey,fontSize: 12),),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: Icon(Icons.check,color: Colors.white,),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.tealAccent.shade400
                      ),
                    )
                  ],
                ),
              ),flex: 100,)
            ],
          ),),
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
