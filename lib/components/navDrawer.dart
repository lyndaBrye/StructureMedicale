import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kSearchBackgroundColor,
      child: ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(child: Text(
              'Menu',
              style: TextStyle(
                  color: kTitleTextColor,
                  fontSize: 25),
            ),)
          ),

          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profil',style: TextStyle(
    color: kTitleTextColor,
    fontSize: 15)),
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Parametres',style: TextStyle(
                color: kTitleTextColor,
                fontSize: 15)),

          ),

          ListTile(
            leading: Icon(Icons.info),
            title: Text('Informations',style: TextStyle(
                color: kTitleTextColor,
                fontSize: 15)),
          ),



        ],
      ),
    );
  }
}