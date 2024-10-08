import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogue/themes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.canvasColor,
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: MyTheme.DarkColor,
              ),
              margin: EdgeInsets.zero,
              accountName: const Text(
                "Vansh Sethi",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              accountEmail: const Text(
                "vansh.sethi98760@gmail.com",
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/1684992616735.jpeg"),
              )),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          leading: Icon(
            CupertinoIcons.home,
          ),
          title: Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaler: TextScaler.linear(1.1),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed('/profile');
          },
          leading: Icon(
            CupertinoIcons.profile_circled,
          ),
          title: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaler: TextScaler.linear(1.1),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed('/users');
          },
          leading: Icon(
            Icons.supervised_user_circle_sharp,
          ),
          title: Text(
            "Users",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaler: TextScaler.linear(1.1),
          ),
        ),
        ListTile(
          onTap: () async {
            final Uri emailUri = Uri(
              scheme: 'mailto',
              path: 'vansh.sethi98760@gmail.com',
              queryParameters: {
                'subject': 'Fliptronics',
                'body': 'Contact',
              },
            );

            if (await canLaunchUrl(emailUri)) {
              await launchUrl(emailUri);
            } else {
              throw 'Could not open email client';
            }
          },
          leading: Icon(
            CupertinoIcons.mail,
          ),
          title: Text(
            "Contact Us",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaler: TextScaler.linear(1.1),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 35), // Space at the top
            Align(
              alignment: Alignment.centerLeft, // Align to the left
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pushReplacementNamed("/login");
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.shadowColor),
                child: "Sign Out".text.color(Colors.white).make(),
              ),
            ),
            // Other widgets
          ],
        ).px64()
      ]),
    );
  }
}
