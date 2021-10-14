import 'package:sipimo_app/AppThemeNotifier.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sipimo_app/AppTheme.dart';

class DriverDetail extends StatefulWidget {
  @override
  _DriverDetailState createState() => _DriverDetailState();
}

class _DriverDetailState extends State<DriverDetail> {
  ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: ListView(
              children: <Widget>[
                Container(
                  color: Color(0xff04a6bb),
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: MySize.size24),
                  alignment: Alignment.center,
                  color: Color(0xff04a6bb),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: MySize.size16),
                            width: MySize.getScaledSizeHeight(140),
                            height: MySize.getScaledSizeHeight(140),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage("./assets/images/driver.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                      Text("Wahyu Nugroho",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline6,
                              fontWeight: 600,
                              fontSize: 20,
                              color: themeData.colorScheme.onPrimary,
                              letterSpacing: 0)),
                      Text("NIK : 441200360964",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              color: themeData.colorScheme.onPrimary,
                              fontWeight: 500)),
                    ],
                  ),
                ),
                Container(
                    margin: Spacing.vertical(0),
                    child: Divider(
                      height: 0,
                    )),
                Container(
                  padding: EdgeInsets.only(
                      top: MySize.size24,
                      left: MySize.size24,
                      right: MySize.size24),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                          maxLines: 2,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              letterSpacing: 0.1,
                              fontWeight: 500),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                letterSpacing: 0.1,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            prefixIcon: Icon(
                              MdiIcons.mapMarker,
                            ),
                            contentPadding: EdgeInsets.all(2),
                          ),
                          readOnly: true,
                          controller: TextEditingController(
                              text:
                                  "Perumahan Griya Mandala, Jl. Kehormatan Blok A Kebon Jeruk, Jakarta Barat"),
                        ),
                      ),
                      Container(
                          margin: Spacing.vertical(5),
                          child: Divider(
                            height: 0,
                          )),
                      Container(
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              letterSpacing: 0.1,
                              fontWeight: 500),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                letterSpacing: 0.1,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            prefixIcon: Icon(
                              MdiIcons.email,
                            ),
                            contentPadding: EdgeInsets.all(2),
                          ),
                          readOnly: true,
                          controller:
                              TextEditingController(text: "wahyu@gmail.com"),
                        ),
                      ),
                      Container(
                          margin: Spacing.vertical(5),
                          child: Divider(
                            height: 0,
                          )),
                      Container(
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              letterSpacing: 0.1,
                              fontWeight: 500),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                letterSpacing: 0.1,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            prefixIcon: Icon(
                              MdiIcons.phone,
                            ),
                            contentPadding: EdgeInsets.all(2),
                          ),
                          readOnly: true,
                          controller:
                              TextEditingController(text: "081224193854"),
                        ),
                      ),
                      Container(
                          margin: Spacing.vertical(5),
                          child: Divider(
                            height: 0,
                          )),
                      Container(
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              letterSpacing: 0.1,
                              fontWeight: 500),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                letterSpacing: 0.1,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            prefixIcon: Icon(MdiIcons.genderTransgender),
                            contentPadding: EdgeInsets.all(2),
                          ),
                          readOnly: true,
                          controller: TextEditingController(text: "Laki-Laki"),
                        ),
                      ),
                      Container(
                          margin: Spacing.vertical(5),
                          child: Divider(
                            height: 0,
                          )),
                    ],
                  ),
                ),
              ],
            )));
      },
    );
  }
}
