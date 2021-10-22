import 'package:sipimo_app/helpers/baseurl.dart';
import 'package:sipimo_app/main.dart';
import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:sipimo_app/MainApp.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sipimo_app/AppTheme.dart';
import 'package:sipimo_app/AppThemeNotifier.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sipimo_app/helpers/baseurl.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginStatus _loginStatus = LoginStatus.notSignIn;

  bool _passwordVisible = false, _check = false;
  ThemeData themeData;

  savePref(String id_user, String nama_user, String bagian, String id_atasan,
      String email, String key, String status) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("id_user", id_user);
      preferences.setString("nama_user", nama_user);
      preferences.setString("bagian", bagian);
      preferences.setString("id_atasan", id_atasan);
      preferences.setString("email", email);
      preferences.setString("key", key);
      preferences.setString("status", status);
      preferences.commit();
    });
  }

  var value, id_user, key;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("status");
      id_user = preferences.getString("id_user");
      key = preferences.getString("key");

      print(value);

      //jika loginStatus valuenya = 1 LoginStatus jadi signIn jika tidak notSignIn
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  // ProgressDialog pr;

  login(String email, String password) async {
    // print("eamil : " + email + " password : " + password);
    // pr.show();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Auth-Key': 'quadraninovasidriverjkt2021',
      'Client-Service': 'qino-client'
    };

    final msg = jsonEncode({
      "email": email,
      "password": password,
    });

    var response = await http.post(
      BaseUrl.login,
      headers: headers,
      body: msg,
    );

    // final response = await http.post(BaseUrl.login,
    //     headers: headers, body: {"email": email, "password": password});
    final data = jsonDecode(response.body);

    int code = data['status'];
    String mess = data['message'];
    final res = data['data'];

    // print(code + " " + mess);
    if (code == 200) {
      String id_user = res['id_user'];
      String nama_user = res['nama_user'];
      String bagian = res['bagian'];
      String id_atasan = res['id_atasan'];
      String email = res['email'];
      String jenis = res['key'];
      String status = res['status'];

      Fluttertoast.showToast(
        msg: "Login Berhasil !!",
        toastLength: Toast.LENGTH_LONG,
      );

      // pr.hide();
      setState(() {
        _loginStatus = LoginStatus.signIn;

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MainScreen();
        }));

        savePref(id_user, nama_user, bagian, id_atasan, email, key, status);
      });
    } else {
      // Fluttertoast.showToast(
      //   msg: mess,
      //   toastLength: Toast.LENGTH_LONG,
      // );
      Fluttertoast.showToast(
          msg: "login Gagal",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      // pr.hide();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MainScreen();
    }));
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Consumer<AppThemeNotifier>(
          builder:
              (BuildContext context, AppThemeNotifier value, Widget child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
                home: Scaffold(
                    body: Stack(
                  children: <Widget>[
                    ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Card(
                          child: Container(
                            padding: EdgeInsets.only(bottom: MySize.size16),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: MySize.size24,
                                  ),
                                  child: Image.asset(
                                      './assets/images/banner-sipimo.png'),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: MySize.size16,
                                      right: MySize.size16),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            letterSpacing: 0.1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 500),
                                        controller: _usernameController,
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              letterSpacing: 0.1,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 500),
                                          prefixIcon:
                                              Icon(MdiIcons.emailOutline),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: MySize.size16),
                                        child: TextFormField(
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              letterSpacing: 0.1,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 500),
                                          controller: _passwordController,
                                          decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle2,
                                                letterSpacing: 0.1,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500),
                                            prefixIcon:
                                                Icon(MdiIcons.lockOutline),
                                            suffixIcon: IconButton(
                                              icon: Icon(_passwordVisible
                                                  ? MdiIcons.eyeOutline
                                                  : MdiIcons.eyeOffOutline),
                                              onPressed: () {
                                                setState(() {
                                                  _passwordVisible =
                                                      !_passwordVisible;
                                                });
                                              },
                                            ),
                                          ),
                                          obscureText: _passwordVisible,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              activeColor:
                                                  themeData.colorScheme.primary,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _check = value;
                                                  final username =
                                                      _usernameController.text
                                                          .trim();
                                                  final password =
                                                      _passwordController.text
                                                          .trim();
                                                  login(username, password);
                                                });
                                              },
                                              value: _check,
                                              visualDensity:
                                                  VisualDensity.compact,
                                            ),
                                            Text(
                                              "Remember me",
                                              style: themeData
                                                  .textTheme.bodyText2
                                                  .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground)),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: MySize.size16),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size24)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: themeData
                                                  .colorScheme.primary
                                                  .withAlpha(18),
                                              blurRadius: 3,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: FlatButton(
                                            padding: EdgeInsets.only(
                                                top: MySize.size10,
                                                bottom: MySize.size10),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24)),
                                            color: Color(0xff04a6bb),
                                            splashColor: Colors.white,
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainScreen()));
                                            },
                                            child: Text("LOGIN",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.button,
                                                    fontWeight: 600,
                                                    color: themeData
                                                        .colorScheme.onPrimary,
                                                    letterSpacing: 0.5))),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MainScreen()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: MySize.size16),
                            child: Center(
                              child: RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: "Don't have an Account? ",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          fontWeight: 500)),
                                  TextSpan(
                                      text: " Register",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          fontWeight: 600,
                                          color: Color(0xff04a6bb))),
                                ]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )));
          },
        );
        break;

      case LoginStatus.signIn:
        return MainScreen();
        break;
    }
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
