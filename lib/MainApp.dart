import 'package:sipimo_app/SingleGridItem.dart';
import 'package:sipimo_app/drawer.dart';
import 'package:sipimo_app/driver/driver-histori.dart';
import 'package:sipimo_app/ksa/MainKsa.dart';
import 'package:sipimo_app/manager/manager-histori.dart';
import 'package:sipimo_app/others/NotificationSettingScreen.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sipimo_app/AppTheme.dart';
import 'package:sipimo_app/AppThemeNotifier.dart';
import 'package:sipimo_app/pegawai/pegawai-permohonan-izin.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ThemeData themeData;
  NavigationBarTheme navigationBarTheme;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        navigationBarTheme =
            AppTheme.getNavigationThemeFromMode(value.themeMode());
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
                title: Image.asset(
                  './assets/images/logo.png',
                  width: 150,
                  fit: BoxFit.fitWidth,
                ),
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
              body: SizedBox.expand(
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 150.0, top: 50.0, bottom: 10.0),
                      child: Text(
                        "PILIH DEMO :",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 700),
                      ),
                    ),
                    GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        padding: const EdgeInsets.all(16.0),
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 10.0,
                        children: <Widget>[
                          SinglePageItem(
                            title: "PEGAWAI",
                            icon: './assets/icons/profile-outline.png',
                            navigation: PegawaiRequest(),
                          ),
                          SinglePageItem(
                            title: "MANAGER",
                            icon: './assets/icons/shapes-outline.png',
                            navigation: ManagerHistori(),
                          ),
                          SinglePageItem(
                            title: "KSA",
                            icon: './assets/icons/course-outline.png',
                            navigation: MainKsa(),
                          ),
                          SinglePageItem(
                            title: "DRIVER",
                            icon: './assets/icons/worker.png',
                            navigation: DriverHistori(),
                          ),
                        ]),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
