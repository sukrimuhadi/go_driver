import 'package:sipimo_app/drawer.dart';
import 'package:sipimo_app/ksa/ksa-daftar-driver.dart';
import 'package:sipimo_app/ksa/ksa-daftar-mobil.dart';
import 'package:sipimo_app/ksa/ksa-histori.dart';
import 'package:sipimo_app/others/NotificationSettingScreen.dart';
import 'package:sipimo_app/others/CustomBottomNavigation.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sipimo_app/AppTheme.dart';
import 'package:sipimo_app/AppThemeNotifier.dart';

class MainKsa extends StatefulWidget {
  @override
  _MainKsaState createState() => _MainKsaState();
}

class _MainKsaState extends State<MainKsa> {
  ThemeData themeData;
  int _currentIndex = 0;
  PageController _pageController;

  NavigationBarTheme navigationBarTheme;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: <Widget>[
                    KsaHistori(),
                    DaftarMobil(),
                    DaftarDriver(),
                  ],
                ),
              ),
              bottomNavigationBar: CustomBottomNavigation(
                animationDuration: Duration(milliseconds: 350),
                selectedItemOverlayColor:
                    navigationBarTheme.selectedOverlayColor,
                backgroundColor: navigationBarTheme.backgroundColor,
                selectedIndex: _currentIndex,
                onItemSelected: (index) {
                  setState(() => _currentIndex = index);
                  _pageController.jumpToPage(index);
                },
                items: <CustomBottomNavigationBarItem>[
                  CustomBottomNavigationBarItem(
                      title: "Histori",
                      icon: Icon(MdiIcons.viewListOutline, size: MySize.size24),
                      activeIcon:
                          Icon(MdiIcons.viewListOutline, size: MySize.size24),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: "Mobil",
                      icon: Icon(MdiIcons.car, size: MySize.size24),
                      activeIcon: Icon(MdiIcons.car, size: MySize.size24),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: "Driver",
                      icon: Icon(MdiIcons.accountGroup, size: MySize.size24),
                      activeIcon:
                          Icon(MdiIcons.accountGroup, size: MySize.size24),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                ],
              ),
            ));
      },
    );
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
