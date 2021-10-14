import 'package:sipimo_app/AppTheme.dart';
import 'package:sipimo_app/AppThemeNotifier.dart';
import 'package:sipimo_app/ksa/ksa-detail-driver.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class DaftarDriver extends StatefulWidget {
  @override
  _ChatHomeScreenState createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<DaftarDriver> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: Scaffold(
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: ListView(
                      padding: Spacing.zero,
                      children: <Widget>[
                        Container(
                          color: customAppTheme.bgLayer1,
                          child: Container(
                            padding: Spacing.all(24),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: Spacing.top(24),
                                  child: singleChat(
                                      image: './assets/images/driver.png',
                                      status: "Tersedia",
                                      nik: "01114765033",
                                      name: "Muhammad Zaim",
                                      isActive: true),
                                ),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/driver.png',
                                    status: "Tersedia",
                                    nik: "441200360964",
                                    name: "Agus Joko Susilo"),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/driver.png',
                                    status: "Diluar",
                                    nik: "441200409177",
                                    name: "Friyadi Simamora"),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/driver.png',
                                    status: "Diluar",
                                    nik: "441200348712",
                                    name: "Wahyu Nugroho"),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/driver.png',
                                    status: "Tersedia",
                                    nik: "441200360964",
                                    name: "Kian Santang"),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/driver.png',
                                    status: "Tersedia",
                                    nik: "441200360964",
                                    name: "Pramuka Sinorogo"),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/driver.png',
                                    status: "Diluar",
                                    nik: "441200585447",
                                    name: "Edwin Nurdiansyah"),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/driver.png',
                                    status: "Diluar",
                                    nik: "441200463435",
                                    name: "Yopie Roy Munanto"),
                              ],
                            ),
                          ),
                        )
                      ],
                    ))));
      },
    );
  }

  Widget singleChat(
      {String image,
      String name,
      String nik,
      String status,
      bool isActive = false}) {
    String tag = image + name;

    Widget badgeWidget = status == "Tersedia"
        ? Container(
            margin: Spacing.top(2),
            padding: Spacing.fromLTRB(10, 6, 10, 6),
            decoration: BoxDecoration(
              color: Color(0xff04a6bb),
              borderRadius: BorderRadius.all(Radius.circular(MySize.size24)),
            ),
            child: Text(
              status,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onPrimary,
                  letterSpacing: 0,
                  fontWeight: 500),
            ),
          )
        : Container(
            margin: Spacing.top(2),
            padding: Spacing.fromLTRB(10, 6, 10, 6),
            decoration: BoxDecoration(
              color: customAppTheme.colorError,
              borderRadius: BorderRadius.all(Radius.circular(MySize.size24)),
            ),
            child: Text(
              status,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onPrimary,
                  letterSpacing: 0,
                  fontWeight: 500),
            ),
          );

    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DriverDetail()));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size26)),
                  child: InkWell(
                    child: Hero(
                      tag: tag,
                      transitionOnUserGestures: true,
                      child: Image(
                        image: AssetImage(image),
                        height: MySize.size52,
                        width: MySize.size52,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                    Text(
                      "NIK : " + nik,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: Spacing.left(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[badgeWidget],
              ),
            )
          ],
        ),
      ),
    );
  }
}
