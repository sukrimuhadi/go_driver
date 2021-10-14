import 'package:sipimo_app/others/SizeConfig.dart';
import 'package:sipimo_app/MainApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sipimo_app/AppTheme.dart';
import 'package:sipimo_app/AppThemeNotifier.dart';

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

  login(String email, String password) async {
    print(email + "email:isepokon@gmail.com");
    print(password + "password:pln123");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainScreen()));
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
                                  left: MySize.size16, right: MySize.size16),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        letterSpacing: 0.1,
                                        color:
                                            themeData.colorScheme.onBackground,
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
                                      prefixIcon: Icon(MdiIcons.emailOutline),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: MySize.size16),
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
                                        prefixIcon: Icon(MdiIcons.lockOutline),
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
                                          visualDensity: VisualDensity.compact,
                                        ),
                                        Text(
                                          "Remember me",
                                          style: themeData.textTheme.bodyText2
                                              .merge(TextStyle(
                                                  color: themeData.colorScheme
                                                      .onBackground)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: MySize.size16),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size24)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: themeData.colorScheme.primary
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
                                          final username =
                                              _usernameController.text.trim();
                                          final password =
                                              _passwordController.text.trim();
                                          login(username, password);
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
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
