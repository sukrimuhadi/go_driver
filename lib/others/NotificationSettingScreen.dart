//import 'package:sipimo_app/AppThemeNotifier.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:provider/provider.dart';

import 'package:sipimo_app/AppTheme.dart';

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.backgroundColor,
        elevation: 0,
        title: Text("Notification",
            style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                fontWeight: 600)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: MySize.size16),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.notificationClearAll,
                size: MySize.size24,
                color: themeData.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: themeData.backgroundColor,
        padding: EdgeInsets.all(MySize.size16),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Offers",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    width: MySize.size18,
                    height: MySize.size18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size10))),
                    child: Center(
                        child: Text(
                      "2",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontSize: 10,
                          color: themeData.colorScheme.primary,
                          fontWeight: 600),
                    )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/images/driver.png',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "50% OFF",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600,
                              letterSpacing: 0.2)),
                      TextSpan(
                          text: "in ultraboost all puma ltd shoes",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0.2))
                    ]),
                  ),
                  time: "9:35 AM"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/images/driver.png',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "30% OFF",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600,
                              letterSpacing: 0.2)),
                      TextSpan(
                          text: "in all cake till 31 july",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0.2))
                    ]),
                  ),
                  time: "9:35 AM"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Orders",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    width: MySize.size18,
                    height: MySize.size18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size10))),
                    child: Center(
                        child: Text(
                      "8",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontSize: 10,
                          color: themeData.colorScheme.primary,
                          fontWeight: 600),
                    )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/images/driver.png',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text:
                              "Your cake order has been delivered at Himalaya",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0))
                    ]),
                  ),
                  time: "Just Now"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/images/driver.png',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "last order has_been cancelled by seller",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0.2))
                    ]),
                  ),
                  time: "14 July"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: Center(
                child: Text(
                  "View all",
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: themeData.colorScheme.primary,
                      fontWeight: 600,
                      letterSpacing: 0.2),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Security",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    width: MySize.size18,
                    height: MySize.size18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size10))),
                    child: Center(
                        child: Text(
                      "1",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontSize: 10,
                          color: themeData.colorScheme.primary,
                          fontWeight: 600),
                    )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/images/driver.png',
                  text: RichText(
                    text: TextSpan(
                        text: "Your account password has been changed",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2)),
                  ),
                  time: "2 days ago"),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleNotification({String image, RichText text, String time}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MySize.size44,
            height: MySize.size44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
                margin:
                    EdgeInsets.only(left: MySize.size18, right: MySize.size18),
                child: text),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    color: themeData.colorScheme.onBackground,
                    fontSize: 12,
                    muted: true,
                    fontWeight: 500,
                    letterSpacing: -0.2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
