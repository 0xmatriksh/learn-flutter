import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl =
      'https://media-exp1.licdn.com/dms/image/C5103AQE6BRasxSn41Q/profile-displayphoto-shrink_400_400/0/1556333274569?e=1626912000&v=beta&t=tLZSNzq_emSX88f1naZxQ_DWBtVK7j_9EOO1cb_Hc9U';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text('Kishmat Bhattarai'),
                accountEmail: Text('kishmat17@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
              padding: EdgeInsets.zero,
            ),
            ListTile(
              leading: IconButton(icon: Icon(CupertinoIcons.home),
              onPressed: () {
              }),
              title: Text('Home'),
            ),
            SizedBox(
              height: 8.0,
            ),
            ListTile(
              leading: IconButton(icon: Icon(CupertinoIcons.person),
              onPressed: () {
              }),
              title: Text('Profile'),
            ),
            SizedBox(
              height: 8.0,
            ),
            ListTile(
              leading: IconButton(icon: Icon(CupertinoIcons.mail),
              onPressed: () {
              } ,
            ),
              title: Text('Email me'),
            ),
            SizedBox(
              height: 8.0,
            ),
            ListTile(
              leading: IconButton(icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              } ,
            ),
              title: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
