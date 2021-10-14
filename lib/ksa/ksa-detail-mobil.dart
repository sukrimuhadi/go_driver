//import 'dart:html';
import 'dart:ui';

import 'package:sipimo_app/AppThemeNotifier.dart';
//import 'package:sipimo_app/others/Generator.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:sipimo_app/AppTheme.dart';

class DetailMobil extends StatefulWidget {
  @override
  _DetailMobilState createState() => _DetailMobilState();
}

class _DetailMobilState extends State<DetailMobil> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                body: Container(
                  color: themeData.backgroundColor,
                  child: Column(
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage(
                                  './assets/images/mobil/mobil1.jpg'),
                              fit: BoxFit.cover,
                              width: MySize.safeWidth,
                              height: MySize.getScaledSizeHeight(350),
                            ),
                            Positioned(
                              child: Container(
                                margin: Spacing.fromLTRB(24, 48, 24, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: Spacing.all(8),
                                        decoration: BoxDecoration(
                                          color: customAppTheme.bgLayer1,
                                          border: Border.all(
                                              color: customAppTheme.bgLayer4,
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size8)),
                                        ),
                                        child: Icon(MdiIcons.chevronLeft,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(220),
                                            size: MySize.size20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: Spacing.vertical(0),
                          children: [
                            Container(
                              margin: Spacing.fromLTRB(24, 0, 24, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'XPANDER',
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline5,
                                          fontSize: 22,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                  ),
                                  Container(
                                    margin: Spacing.top(2),
                                    padding: Spacing.fromLTRB(10, 6, 10, 6),
                                    decoration: BoxDecoration(
                                      color: Color(0xff04a6bb),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size24)),
                                    ),
                                    child: Text(
                                      "Tersedia",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                          letterSpacing: 0,
                                          fontWeight: 500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: Spacing.fromLTRB(24, 16, 24, 0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: Spacing.all(8),
                                        decoration: BoxDecoration(
                                            color: themeData.colorScheme.primary
                                                .withAlpha(24),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(MySize.size8))),
                                        child: Icon(
                                          MdiIcons.car,
                                          size: MySize.size30,
                                          color: themeData.colorScheme.primary,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: Spacing.left(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Merek",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.caption,
                                                    fontWeight: 600,
                                                    fontSize: 16,
                                                    color: themeData.colorScheme
                                                        .onBackground),
                                              ),
                                              Container(
                                                margin: Spacing.top(0),
                                                child: Text(
                                                  "Mitsubishi",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption,
                                                      fontSize: 16,
                                                      fontWeight: 500,
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground,
                                                      xMuted: true),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: Spacing.top(16),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: Spacing.all(8),
                                          decoration: BoxDecoration(
                                              color: themeData
                                                  .colorScheme.primary
                                                  .withAlpha(24),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      MySize.size8))),
                                          child: Icon(
                                            MdiIcons.counter,
                                            size: MySize.size30,
                                            color:
                                                themeData.colorScheme.primary,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: Spacing.left(16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Kapasitas",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption,
                                                      fontWeight: 600,
                                                      fontSize: 16,
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground),
                                                ),
                                                Container(
                                                  margin: Spacing.top(0),
                                                  child: Text(
                                                    "8 Orang",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .caption,
                                                            fontSize: 16,
                                                            fontWeight: 500,
                                                            color: themeData
                                                                .colorScheme
                                                                .onBackground,
                                                            xMuted: true),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: Spacing.top(16),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: Spacing.all(8),
                                          decoration: BoxDecoration(
                                              color: themeData
                                                  .colorScheme.primary
                                                  .withAlpha(24),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      MySize.size8))),
                                          child: Icon(
                                            MdiIcons.contentDuplicate,
                                            size: MySize.size30,
                                            color:
                                                themeData.colorScheme.primary,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: Spacing.left(16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Kondisi",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption,
                                                      fontWeight: 600,
                                                      fontSize: 16,
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground),
                                                ),
                                                Container(
                                                  margin: Spacing.top(0),
                                                  child: Text(
                                                    "Bagus",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .caption,
                                                            fontSize: 16,
                                                            fontWeight: 500,
                                                            color: themeData
                                                                .colorScheme
                                                                .onBackground,
                                                            xMuted: true),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: Spacing.fromLTRB(24, 24, 24, 0),
                              child: Text(
                                "Catatan :",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 700,
                                    color: themeData.colorScheme.onBackground),
                              ),
                            ),
                            Container(
                              margin: Spacing.fromLTRB(24, 12, 24, 0),
                              child: Text(
                                  "Kenyamanan berkendara dan kemewahan jadi hal pokok yang selalu diimpikan keluarga Indonesia. Mitsubishi Xpander hadir dengan kabin luas dipadu pilihan material dan desain interior layaknya MPV kelas atas."),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleContent(
      {String index, String time, String title, bool enabled = true}) {
    return Container(
      margin: Spacing.bottom(24),
      child: Row(
        children: <Widget>[
          Text(
            index,
            style: AppTheme.getTextStyle(themeData.textTheme.headline5,
                color: themeData.colorScheme.onBackground.withAlpha(80),
                fontWeight: 600),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    time,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground, muted: true),
                  ),
                  Text(
                    title,
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: enabled ? 1 : 0.7,
            child: Container(
              margin: Spacing.left(16),
              padding: Spacing.all(8),
              decoration: BoxDecoration(
                  color: themeData.colorScheme.primary, shape: BoxShape.circle),
              child: Icon(
                MdiIcons.play,
                color: themeData.colorScheme.onPrimary,
                size: MySize.size20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
