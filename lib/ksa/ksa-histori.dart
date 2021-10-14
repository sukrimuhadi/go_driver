import 'package:sipimo_app/drawer.dart';
import 'package:sipimo_app/ksa/ksa-approval.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:sipimo_app/AppTheme.dart';
import 'package:sipimo_app/AppThemeNotifier.dart';

class KsaHistori extends StatefulWidget {
  @override
  _KsaHistoriState createState() => _KsaHistoriState();
}

class _KsaHistoriState extends State<KsaHistori> {
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
                                margin: Spacing.top(8),
                                child: singleTask(
                                  name: "Nama User",
                                  statusText: "Approve",
                                  submissionDate: "22/07/20",
                                  alamat:
                                      "Jl. Cinta Boulevard Bintaro, Pesanggrahan, Jaksel",
                                ),
                              ),
                              singleTask(
                                name: "Nama User",
                                statusText: "Approve",
                                submissionDate: "22/07/20",
                                alamat:
                                    "Jl. Kacang Kapri Muda Kav. 13 Utan Kayu Selatan, Matraman, Jakarta Timur",
                              ),
                              singleTask(
                                name: "Nama User",
                                statusText: "Approve",
                                submissionDate: "22/07/20",
                                alamat:
                                    "Jl. Cinta Boulevard Bintaro, Pesanggrahan, Jaksel",
                              ),
                              singleTask(
                                name: "Nama User",
                                statusText: "Approve",
                                submissionDate: "22/07/20",
                                alamat:
                                    "Jl. Kacang Kapri Muda Kav. 13 Utan Kayu Selatan, Matraman, Jakarta Timur",
                              ),
                              singleTask(
                                name: "Nama User",
                                statusText: "Approve",
                                submissionDate: "22/07/20",
                                alamat:
                                    "Jl. Cinta Boulevard Bintaro, Pesanggrahan, Jaksel",
                              ),
                              singleTask(
                                name: "Nama User",
                                statusText: "Approve",
                                submissionDate: "22/07/20",
                                alamat:
                                    "Jl. Kacang Kapri Muda Kav. 13 Utan Kayu Selatan, Matraman, Jakarta Timur",
                              ),
                            ],
                          ),
                        )
                      ],
                    ))));
      },
    );
  }

  Widget singleTask(
      {String name, String submissionDate, String alamat, String statusText}) {
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
                MaterialPageRoute(builder: (context) => KsaApproval()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: Spacing.all(6),
                decoration: BoxDecoration(
                    color: themeData.colorScheme.primary,
                    shape: BoxShape.circle),
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
                        name,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                      Container(
                        margin: Spacing.top(2),
                        child: Text(
                          alamat,
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
                      "Manager " + statusText,
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
