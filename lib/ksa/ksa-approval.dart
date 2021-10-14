import 'package:sipimo_app/AppThemeNotifier.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:sipimo_app/AppTheme.dart';

class KsaApproval extends StatefulWidget {
  @override
  _KsaApprovalState createState() => _KsaApprovalState();
}

class _KsaApprovalState extends State<KsaApproval> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  List<String> _driver = <String>[
    '',
    'Driver 1',
    'Driver 2',
    'Driver 3',
    'Driver 4',
    'Driver 5'
  ];
  String _pilihdriver = '';

  List<String> _mobil = <String>[
    '',
    'Avanza',
    'Xenia',
    'Pajero',
    'Inova',
    'Rush'
  ];
  String _pilihmobil = '';

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
                  title: Text("PILIH DRIVER & MOBIL",
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
                                  readOnly: true,
                                  controller: TextEditingController(
                                      text: "Tatang Sutarman"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Tanggal Jalan",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(Icons.date_range),
                                    ),
                                    readOnly: true,
                                    controller: TextEditingController(
                                        text: "12 Desember 2021"),
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
                                    readOnly: true,
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
                                    readOnly: true,
                                    controller:
                                        TextEditingController(text: "8 orang"),
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
                                    readOnly: true,
                                    controller: TextEditingController(
                                        text:
                                            "Agus, Hidayat, Rustam, Paijo, Abo, Kun, Sri"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Manager Approval",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(Icons.approval),
                                    ),
                                    readOnly: true,
                                    controller:
                                        TextEditingController(text: "Approve"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: FormField(
                                    builder: (FormFieldState state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.menu),
                                          labelText: 'Pilih Driver',
                                        ),
                                        isEmpty: _pilihdriver == '',
                                        child: new DropdownButtonHideUnderline(
                                          child: new DropdownButton(
                                            dropdownColor: Colors.white,
                                            isExpanded: true,
                                            value: _pilihdriver,
                                            isDense: true,
                                            onChanged: (String newValue) {
                                              setState(() {
                                                _pilihdriver = newValue;
                                                state.didChange(newValue);
                                              });
                                            },
                                            items: _driver.map((String value) {
                                              return new DropdownMenuItem(
                                                value: value,
                                                child: new Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: FormField(
                                    builder: (FormFieldState state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.menu),
                                          labelText: 'Pilih Mobil',
                                        ),
                                        isEmpty: _pilihmobil == '',
                                        child: new DropdownButtonHideUnderline(
                                          child: new DropdownButton(
                                            dropdownColor: Colors.white,
                                            isExpanded: true,
                                            value: _pilihmobil,
                                            isDense: true,
                                            onChanged: (String newValue) {
                                              setState(() {
                                                _pilihmobil = newValue;
                                                state.didChange(newValue);
                                              });
                                            },
                                            items: _mobil.map((String value) {
                                              return new DropdownMenuItem(
                                                value: value,
                                                child: new Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    },
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
                                      color: themeData.colorScheme.primary,
                                      splashColor: Colors.white,
                                      highlightColor: themeData.primaryColor,
                                      onPressed: () {},
                                      child: Text(
                                        "Kirim Ke Bagian Driver",
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
