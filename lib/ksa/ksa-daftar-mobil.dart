import 'package:sipimo_app/AppTheme.dart';
import 'package:sipimo_app/AppThemeNotifier.dart';
import 'package:sipimo_app/ksa/ksa-detail-mobil.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class DaftarMobil extends StatefulWidget {
  @override
  _DaftarMobilState createState() => _DaftarMobilState();
}

class _DaftarMobilState extends State<DaftarMobil> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24) / ((width / 2 - MySize.size24) + 40);
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                body: Container(
                    color: Color(0xffffffff),
                    child: ListView(
                      padding: Spacing.top(24),
                      children: <Widget>[
                        Container(
                          child: GridView.count(
                            physics: ClampingScrollPhysics(),
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            padding: Spacing.fromLTRB(24, 16, 24, 16),
                            childAspectRatio: findAspectRatio(
                                MediaQuery.of(context).size.width),
                            crossAxisSpacing: MySize.size24,
                            mainAxisSpacing: MySize.size24,
                            children: <Widget>[
                              singleResult(
                                  title: "Avanza",
                                  image: "./assets/images/mobil/mobil1.jpg",
                                  price: "Tersedia",
                                  statusColor: Color(0xff04a6bb)),
                              singleResult(
                                  title: "Xenia",
                                  image: "./assets/images/mobil/mobil1.jpg",
                                  price: "Dipakai",
                                  statusColor: Color(0xfff7931e)),
                              singleResult(
                                  title: "Civic",
                                  image: "./assets/images/mobil/mobil1.jpg",
                                  price: "Service",
                                  statusColor: Color(0xffed1c24)),
                              singleResult(
                                  title: "Avanza",
                                  image: "./assets/images/mobil/mobil1.jpg",
                                  price: "Tersedia",
                                  statusColor: Color(0xff04a6bb)),
                              singleResult(
                                  title: "Xenia",
                                  image: "./assets/images/mobil/mobil1.jpg",
                                  price: "Dipakai",
                                  statusColor: Color(0xfff7931e)),
                              singleResult(
                                  title: "Civic",
                                  image: "./assets/images/mobil/mobil1.jpg",
                                  price: "Service",
                                  statusColor: Color(0xffed1c24)),
                            ],
                          ),
                        )
                      ],
                    ))));
      },
    );
  }

  Widget singleResult(
      {String title, String image, String price, Color statusColor}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailMobil()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff1a1a1a),
            borderRadius: BorderRadius.all(
              Radius.circular(MySize.size8),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffc1c1c1),
                  blurRadius: MySize.size8,
                  offset: Offset(0, MySize.size2))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.size8),
                      topRight: Radius.circular(MySize.size8)),
                  child: Image(
                    image: AssetImage(image),
                  ),
                ),
                Container(
                  padding: Spacing.fromLTRB(12, 6, 12, 6),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySize.size8),
                        bottomRight: Radius.circular(MySize.size8)),
                  ),
                  child: Text(
                    price.toString(),
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        color: themeData.colorScheme.onPrimary,
                        fontWeight: 500),
                  ),
                )
              ],
            ),
            Container(
              margin: Spacing.all(8),
              child: Text(
                title,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.bodyText1,
                  fontWeight: 600,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
