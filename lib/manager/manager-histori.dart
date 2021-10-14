import 'package:sipimo_app/drawer.dart';
import 'package:sipimo_app/manager/manager-approval.dart';
import 'package:sipimo_app/manager/manager-driver-approval.dart';
import 'package:sipimo_app/manager/manager-histori-selesai.dart';
import 'package:sipimo_app/manager/manager-ksa-approval.dart';
import 'package:sipimo_app/others/NotificationSettingScreen.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:sipimo_app/AppTheme.dart';
import 'package:sipimo_app/AppThemeNotifier.dart';

class ManagerHistori extends StatefulWidget {
  @override
  _ManagerHistoriState createState() => _ManagerHistoriState();
}

class _ManagerHistoriState extends State<ManagerHistori> {
  ThemeData themeData;
  NavigationBarTheme navigationBarTheme;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        navigationBarTheme =
            AppTheme.getNavigationThemeFromMode(value.themeMode());
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
              drawer: Drawer(
                child: DrawerKeren(),
              ),
              appBar: AppBar(
                backgroundColor: themeData.appBarTheme.color,
                centerTitle: true,
                title: Text("HISTORI PERMOHONAN IZIN",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontSize: 15.5, fontWeight: 600)),
                actions: <Widget>[
                  Container(
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return NotificationDialog();
                          },
                          fullscreenDialog: true));
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            MdiIcons.bellOutline,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(200),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 15,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            height: MySize.size14,
                            width: MySize.size14,
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.primary,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size40))),
                            child: Center(
                              child: Text(
                                "6",
                                style: AppTheme.getTextStyle(
                                  themeData.textTheme.overline,
                                  color: themeData.colorScheme.onPrimary,
                                  fontSize: 9,
                                  fontWeight: 500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
              body: DefaultTabController(
                length: 4,
                initialIndex: 0,
                child: new Scaffold(
                  appBar: new AppBar(
                    backgroundColor: Color(0xff04a6bb),
                    flexibleSpace: new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /*-------------- Build Tabs here ------------------*/
                        new TabBar(
                          tabs: [
                            Tab(
                                child: Text("Pegawai",
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600,
                                      fontSize: 14.5,
                                      color: themeData.colorScheme.onPrimary,
                                    ))),
                            Tab(
                                child: Text("KSA",
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600,
                                      fontSize: 14.5,
                                      color: themeData.colorScheme.onPrimary,
                                    ))),
                            Tab(
                                child: Text("Driver",
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600,
                                      fontSize: 14.5,
                                      color: themeData.colorScheme.onPrimary,
                                    ))),
                            Tab(
                                child: Text("Selesai",
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600,
                                      fontSize: 14.5,
                                      color: themeData.colorScheme.onPrimary,
                                    ))),
                          ],
                        )
                      ],
                    ),
                  ),

                  /*--------------- Build Tab body here -------------------*/
                  body: TabBarView(
                    children: <Widget>[
                      Container(
                          color: customAppTheme.bgLayer1,
                          child: ListView(
                            padding: Spacing.zero,
                            children: <Widget>[
                              Container(
                                margin: Spacing.fromLTRB(0, 8, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: Spacing.top(8),
                                      child: singleTask(
                                          subject: "Nama User",
                                          task:
                                              "Jl. Rengas Dengklok Blok C1 no 36 Kalimantan",
                                          statusText: "Request Baru",
                                          status: 1,
                                          submissionDate: "22/07/20"),
                                    ),
                                    singleTask(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Request Baru",
                                        status: 1,
                                        submissionDate: "22/07/20"),
                                    singleTask(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Request Baru",
                                        status: 1,
                                        submissionDate: "22/07/20"),
                                    singleTask(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Request Baru",
                                        status: 1,
                                        submissionDate: "22/07/20"),
                                    singleTask(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Request Baru",
                                        status: 1,
                                        submissionDate: "22/07/20"),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Container(
                          color: customAppTheme.bgLayer1,
                          child: ListView(
                            padding: Spacing.zero,
                            children: <Widget>[
                              Container(
                                margin: Spacing.fromLTRB(0, 8, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: Spacing.top(8),
                                      child: singleTask1(
                                          subject: "Nama User",
                                          task:
                                              "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                          statusText: "Approve KSA",
                                          status: 0,
                                          submissionDate: "22/07/20"),
                                    ),
                                    singleTask1(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Approve KSA",
                                        status: 0,
                                        submissionDate: "22/07/20"),
                                    singleTask1(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Approve KSA",
                                        status: 0,
                                        submissionDate: "22/07/20"),
                                    singleTask1(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Approve KSA",
                                        status: 0,
                                        submissionDate: "22/07/20"),
                                    singleTask1(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Approve KSA",
                                        status: 0,
                                        submissionDate: "22/07/20"),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Container(
                          color: customAppTheme.bgLayer1,
                          child: ListView(
                            padding: Spacing.zero,
                            children: <Widget>[
                              Container(
                                margin: Spacing.fromLTRB(0, 8, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: Spacing.top(8),
                                      child: singleTask2(
                                          subject: "Nama User",
                                          task:
                                              "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                          statusText: "Approve Driver",
                                          status: 2,
                                          submissionDate: "22/07/20"),
                                    ),
                                    singleTask2(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Approve Driver",
                                        status: 2,
                                        submissionDate: "22/07/20"),
                                    singleTask2(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Approve Driver",
                                        status: 2,
                                        submissionDate: "22/07/20"),
                                    singleTask2(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Approve Driver",
                                        status: 2,
                                        submissionDate: "22/07/20"),
                                    singleTask2(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Approve Driver",
                                        status: 2,
                                        submissionDate: "22/07/20"),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Container(
                          color: customAppTheme.bgLayer1,
                          child: ListView(
                            padding: Spacing.zero,
                            children: <Widget>[
                              Container(
                                margin: Spacing.fromLTRB(0, 8, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: Spacing.top(8),
                                      child: singleTask3(
                                          subject: "Nama User",
                                          task:
                                              "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                          statusText: "Selesai",
                                          status: 3,
                                          submissionDate: "22/07/20"),
                                    ),
                                    singleTask3(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Selesai",
                                        status: 3,
                                        submissionDate: "22/07/20"),
                                    singleTask3(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Selesai",
                                        status: 3,
                                        submissionDate: "22/07/20"),
                                    singleTask3(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Selesai",
                                        status: 3,
                                        submissionDate: "22/07/20"),
                                    singleTask3(
                                        subject: "Nama User",
                                        task:
                                            "Kota Baru Rajsari Blok C1 no 36 Kabupaten Bandung",
                                        statusText: "Selesai",
                                        status: 3,
                                        submissionDate: "22/07/20"),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget singleTask(
      {String subject,
      String task,
      String submissionDate,
      String statusText,
      int status = 0}) {
    return Container(
        padding: Spacing.all(16),
        margin: Spacing.fromLTRB(24, 8, 24, 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
            boxShadow: [],
            border: Border.all(color: customAppTheme.bgLayer3, width: 1)),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ManagerApproval()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: Spacing.all(6),
                decoration: BoxDecoration(
                    color: Color(0xff04a6bb), shape: BoxShape.circle),
                child: Icon(
                  MdiIcons.trayFull,
                  color: themeData.colorScheme.onPrimary,
                  size: MySize.size20,
                ),
              ),
              Expanded(
                child: Container(
                  margin: Spacing.left(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        subject,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                      Container(
                        margin: Spacing.top(2),
                        child: Text(
                          task,
                          style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(160),
                            fontWeight: 600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    submissionDate,
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        fontSize: 12,
                        letterSpacing: 0.2,
                        color: themeData.colorScheme.onBackground,
                        muted: true,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(2),
                    padding: Spacing.fromLTRB(10, 6, 10, 6),
                    decoration: BoxDecoration(
                      color: Color(0xff04a6bb),
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size24)),
                    ),
                    child: Text(
                      statusText,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.onPrimary,
                          letterSpacing: 0,
                          fontWeight: 500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget singleTask1(
      {String subject,
      String task,
      String submissionDate,
      String statusText,
      int status = 0}) {
    return Container(
        padding: Spacing.all(16),
        margin: Spacing.fromLTRB(24, 8, 24, 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
            boxShadow: [],
            border: Border.all(color: customAppTheme.bgLayer3, width: 1)),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ManagerKsaApproval()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: Spacing.all(6),
                decoration: BoxDecoration(
                    color: customAppTheme.colorError, shape: BoxShape.circle),
                child: Icon(
                  MdiIcons.spellcheck,
                  color: themeData.colorScheme.onPrimary,
                  size: MySize.size20,
                ),
              ),
              Expanded(
                child: Container(
                  margin: Spacing.left(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        subject,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                      Container(
                        margin: Spacing.top(2),
                        child: Text(
                          task,
                          style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(160),
                            fontWeight: 600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    submissionDate,
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        fontSize: 12,
                        letterSpacing: 0.2,
                        color: themeData.colorScheme.onBackground,
                        muted: true,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(2),
                    padding: Spacing.fromLTRB(10, 6, 10, 6),
                    decoration: BoxDecoration(
                      color: customAppTheme.colorError,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size24)),
                    ),
                    child: Text(
                      statusText,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.onPrimary,
                          letterSpacing: 0,
                          fontWeight: 500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget singleTask2(
      {String subject,
      String task,
      String submissionDate,
      String statusText,
      int status = 0}) {
    return Container(
        padding: Spacing.all(16),
        margin: Spacing.fromLTRB(24, 8, 24, 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
            boxShadow: [],
            border: Border.all(color: customAppTheme.bgLayer3, width: 1)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ManagerDriverApproval()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: Spacing.all(6),
                decoration: BoxDecoration(
                    color: customAppTheme.colorInfo, shape: BoxShape.circle),
                child: Icon(
                  MdiIcons.car,
                  color: themeData.colorScheme.onPrimary,
                  size: MySize.size20,
                ),
              ),
              Expanded(
                child: Container(
                  margin: Spacing.left(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        subject,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                      Container(
                        margin: Spacing.top(2),
                        child: Text(
                          task,
                          style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(160),
                            fontWeight: 600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    submissionDate,
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        fontSize: 12,
                        letterSpacing: 0.2,
                        color: themeData.colorScheme.onBackground,
                        muted: true,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(2),
                    padding: Spacing.fromLTRB(10, 6, 10, 6),
                    decoration: BoxDecoration(
                      color: customAppTheme.colorInfo,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size24)),
                    ),
                    child: Text(
                      statusText,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.onPrimary,
                          letterSpacing: 0,
                          fontWeight: 500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget singleTask3(
      {String subject,
      String task,
      String submissionDate,
      String statusText,
      int status = 0}) {
    return Container(
        padding: Spacing.all(16),
        margin: Spacing.fromLTRB(24, 8, 24, 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
            boxShadow: [],
            border: Border.all(color: customAppTheme.bgLayer3, width: 1)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ManagerHistoriSelesai()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: Spacing.all(6),
                decoration: BoxDecoration(
                    color: customAppTheme.disabledColor,
                    shape: BoxShape.circle),
                child: Icon(
                  MdiIcons.checkBold,
                  color: themeData.colorScheme.onPrimary,
                  size: MySize.size20,
                ),
              ),
              Expanded(
                child: Container(
                  margin: Spacing.left(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        subject,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                      Container(
                        margin: Spacing.top(2),
                        child: Text(
                          task,
                          style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(160),
                            fontWeight: 600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    submissionDate,
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        fontSize: 12,
                        letterSpacing: 0.2,
                        color: themeData.colorScheme.onBackground,
                        muted: true,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(2),
                    padding: Spacing.fromLTRB(10, 6, 10, 6),
                    decoration: BoxDecoration(
                      color: customAppTheme.disabledColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size24)),
                    ),
                    child: Text(
                      statusText,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.onPrimary,
                          letterSpacing: 0,
                          fontWeight: 500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
