import 'package:flutter/material.dart';
import 'package:sipimo_app/MainApp.dart';
import 'package:sipimo_app/auth/login_screen.dart';

class DrawerKeren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,

        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF04a6bb),
            ),
            accountName: Text("USER ROLE"),
            accountEmail: Text("user@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Color(0xFF56ccf2)
                  : Colors.white,
              child: Image.asset('./assets/images/driver.png'),
            ),
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.home,
              color: Color(0xFF04a6bb),
            ),
            trailing: Icon(Icons.more_vert_outlined),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xFF04a6bb),
            ),
            title: Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Color(0xFF04a6bb),
            ),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
