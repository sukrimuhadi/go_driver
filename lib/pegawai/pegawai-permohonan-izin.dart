import 'dart:ui';

import 'package:sipimo_app/AppThemeNotifier.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:sipimo_app/AppTheme.dart';

class PegawaiRequest extends StatefulWidget {
  @override
  _PegawaiRequestState createState() => _PegawaiRequestState();
}

class _PegawaiRequestState extends State<PegawaiRequest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  TimeOfDay selectedTime;
  DateTime selectedDate;

  _pickDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
  }

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
                appBar: AppBar(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  centerTitle: true,
                  title: Text("FORM PERMOHONAN IZIN",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 700)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Nama User",
                                    border:
                                        themeData.inputDecorationTheme.border,
                                    enabledBorder:
                                        themeData.inputDecorationTheme.border,
                                    focusedBorder: themeData
                                        .inputDecorationTheme.focusedBorder,
                                    prefixIcon: Icon(Icons.text_snippet),
                                  ),
                                  controller:
                                      TextEditingController(text: "Nama User"),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  //margin: EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: "Tanggal Jalan",
                                              border: themeData
                                                  .inputDecorationTheme.border,
                                              enabledBorder: themeData
                                                  .inputDecorationTheme.border,
                                              focusedBorder: themeData
                                                  .inputDecorationTheme
                                                  .focusedBorder,
                                              prefixIcon:
                                                  Icon(Icons.calendar_today),
                                            ),
                                            controller: TextEditingController(
                                                text: "14-09-2021"),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 16.0,
                                              left: 17.0,
                                              right: 0.0),
                                          height: 63,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: themeData
                                                      .colorScheme.primary
                                                      .withAlpha(24),
                                                  blurRadius: 2,
                                                  offset: Offset(0, 1),
                                                ),
                                              ],
                                            ),
                                            child: FlatButton(
                                              color: Color(0xff04a6bb),
                                              splashColor: Colors.white,
                                              onPressed: () {
                                                _pickDate(context);
                                              },
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    MdiIcons.calendarOutline,
                                                    color: themeData
                                                        .colorScheme.onPrimary,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    maxLines: 2,
                                    decoration: InputDecoration(
                                      labelText: "Tujuan",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(Icons.map_rounded),
                                    ),
                                    controller: TextEditingController(
                                        text:
                                            "Jl. Kacang Kapri Muda Kav. 13 Utan Kayu Selatan, Matraman, Jakarta Timur"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Jumlah Penumpang",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(
                                          Icons.format_list_numbered_outlined),
                                    ),
                                    controller:
                                        TextEditingController(text: "8"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      labelText: "Rincian Nama",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(Icons.engineering),
                                    ),
                                    controller: TextEditingController(text: ""),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: Spacing.fromLTRB(16, 16, 16, 16),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              MySize.size16)),
                                      color: Color(0xff04a6bb),
                                      splashColor: Colors.white,
                                      highlightColor: themeData.primaryColor,
                                      onPressed: () {},
                                      child: Text(
                                        "Kirim Permohonan Izin",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                      ),
                                      padding:
                                          EdgeInsets.only(top: 12, bottom: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))));
      },
    );
  }
}
