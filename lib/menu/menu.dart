import 'package:flutter/material.dart';
import 'package:flutter_cab/home/payment_menu.dart';
import 'package:flutter_cab/modal/menu_list_item.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';
import 'package:flutter_cab/utils/menu_title.dart';

import '../book_late_pick_date.dart';
import '../emergency_contact.dart';
import '../help_support.dart';
import '../my_trips.dart';
import '../news_offers.dart';
import '../profile.dart';
import '../rate_card.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<MenuListItem> listMenuItem = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listMenuItem
        .add(createMenuItem(MenuTitle.MENU_PROFILE, "images/menu/user.png"));
    listMenuItem
        .add(createMenuItem(MenuTitle.MENU_PAYMENT, "images/menu/payment.png"));
    listMenuItem.add(createMenuItem(
        MenuTitle.MENU_BOOK_LATER, "images/menu/book_later.png"));
    listMenuItem.add(
        createMenuItem(MenuTitle.MENU_MY_TRIPS, "images/menu/my_trips.png"));
    listMenuItem.add(
        createMenuItem(MenuTitle.MENU_RATE_CARD, "images/menu/rate_card.png"));
    listMenuItem.add(createMenuItem(
        MenuTitle.MENU_NEWS_OFFERS, "images/menu/news_offers.png"));
    listMenuItem.add(createMenuItem(MenuTitle.MENU_EMERGENCY_CONTACTS,
        "images/menu/emergency_contacts.png"));
    listMenuItem.add(createMenuItem(
        MenuTitle.MENU_HELP_SUPPORT, "images/menu/help_support.png"));
  }

  createMenuItem(String title, String imgIcon) {
    return MenuListItem(title, imgIcon);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
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
                    BoxShadow(
                        color: Colors.grey.shade50,
                        blurRadius: 1,
                        offset: Offset(0, 1)),
                  ]),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 12, top: 8, right: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          key: Key("UserNameMobile"),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Ishan Madushka",
                              style: CustomTextStyle.mediumTextStyle,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text("+94 71 87 86 729",
                                style: CustomTextStyle.mediumTextStyle
                                    .copyWith(color: Colors.grey, fontSize: 12))
                          ],
                        ),
                        IconButton(
                            key: Key("CloseIcon"),
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ListView.builder(
                    key: Key("ListMenu"),
                    shrinkWrap: true,
                    primary: true,
                    itemBuilder: (context, position) {
                      return createMenuListItemWidget(position);
                    },
                    itemCount: listMenuItem.length,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              )),
        )
      ],
    );
  }

  createMenuListItemWidget(int position) {
    return GestureDetector(
      onTap: () {
        if (listMenuItem[position].title == MenuTitle.MENU_PROFILE) {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => Profile()));
        } else if (listMenuItem[position].title == MenuTitle.MENU_PAYMENT) {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => PaymentMenu()));
        } else if (listMenuItem[position].title == MenuTitle.MENU_BOOK_LATER) {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => BookLaterDatePicker()));
        } else if (listMenuItem[position].title == MenuTitle.MENU_MY_TRIPS) {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => MyTrips()));
        } else if (listMenuItem[position].title == MenuTitle.MENU_RATE_CARD) {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => RateCard()));
        } else if (listMenuItem[position].title ==
            MenuTitle.MENU_EMERGENCY_CONTACTS) {
          Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => EmergencyContacts()));
        } else if (listMenuItem[position].title ==
            MenuTitle.MENU_HELP_SUPPORT) {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => HelpSupport()));
        } else if (listMenuItem[position].title == MenuTitle.MENU_NEWS_OFFERS) {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => NewsOffers()));
        }
      },
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 8,
            ),
            Image(
              image: AssetImage(listMenuItem[position].imgIcon),
            ),
            SizedBox(
              width: 14,
            ),
            Container(
              child: Text(listMenuItem[position].title),
              margin: EdgeInsets.only(left: 12),
            )
          ],
        ),
      ),
    );
  }
}
