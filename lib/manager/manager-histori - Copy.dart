import 'package:sipimo_app/drawer.dart';
import 'package:sipimo_app/manager/manager-approval.dart';
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
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.headline6,
                        fontWeight: 600,
                      )),
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
                body: Container(
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
                                margin: Spacing.fromLTRB(24, 16, 0, 0),
                                child: Text(
                                  "BARU",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontWeight: 700,
                                      muted: true,
                                      color:
                                          themeData.colorScheme.onBackground),
                                ),
                              ),
                              Container(
                                margin: Spacing.top(8),
                                child: singleTask(
                                  subject: "Nama User",
                                  statusText: "Rejected",
                                  submissionDate: "31/07/20",
                                  status: 0,
                                  task: "Surabaya",
                                ),
                              ),
                              singleTask(
                                  subject: "Nama User",
                                  task: "Bali",
                                  statusText: "Approve",
                                  status: 1,
                                  submissionDate: "22/07/20"),
                              singleTask(
                                  subject: "Nama User",
                                  task: "Sulawesi",
                                  statusText: "In Riview",
                                  status: 2,
                                  submissionDate: "20/07/20"),
                              Container(
                                margin: Spacing.fromLTRB(24, 24, 0, 0),
                                child: Text(
                                  "SELESAI",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontWeight: 700,
                                      muted: true,
                                      color:
                                          themeData.colorScheme.onBackground),
                                ),
                              ),
                              Container(
                                margin: Spacing.top(8),
                                child: singleTask(
                                    subject: "Nama User",
                                    task: "Kalimantan",
                                    statusText: "Approve",
                                    status: 1,
                                    submissionDate: "22/07/20"),
                              ),
                              singleTask(
                                  subject: "Nama User",
                                  task: "Kalimantan",
                                  statusText: "Approve",
                                  status: 1,
                                  submissionDate: "22/07/20"),
                              singleTask(
                                  subject: "Nama User",
                                  task: "Kalimantan",
                                  statusText: "Approve",
                                  status: 1,
                                  submissionDate: "22/07/20"),
                            ],
                          ),
                        )
                      ],
                    ))));
      },
    );
  }

  Widget singleTask(
      {String subject,
      String task,
      String submissionDate,
      String statusText,
      int status = 0}) {
    IconData iconData;
    Color iconBG, iconColor, statusColor;
    switch (status) {
      case 0:
        iconBG = customAppTheme.colorError;
        iconColor = customAppTheme.onError;
        iconData = MdiIcons.plus;
        statusColor = customAppTheme.colorError;
        break;
      case 1:
        iconBG = themeData.colorScheme.primary;
        iconColor = themeData.colorScheme.onPrimary;
        iconData = MdiIcons.plus;
        statusColor = themeData.colorScheme.primary;
        break;
      case 2:
        iconBG = customAppTheme.colorInfo;
        iconColor = customAppTheme.onInfo;
        iconData = MdiIcons.pencilOutline;
        statusColor = customAppTheme.colorInfo;
        break;
      case 3:
        iconBG = customAppTheme.disabledColor;
        iconColor = customAppTheme.onDisabled;
        iconData = MdiIcons.spellcheck;
        statusColor = customAppTheme.disabledColor;
        break;
      default:
        iconBG = customAppTheme.colorError;
        iconColor = customAppTheme.onError;
        iconData = MdiIcons.plus;
        statusColor = customAppTheme.colorError;
        break;
    }

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
                decoration:
                    BoxDecoration(color: iconBG, shape: BoxShape.circle),
                child: Icon(
                  iconData,
                  color: iconColor,
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
                    child: Text(
                      statusText,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: statusColor == null
                              ? customAppTheme.colorInfo
                              : statusColor,
                          letterSpacing: 0,
                          fontWeight: status == 3 ? 600 : 500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
