import 'package:dance_of_india/Utils/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: FlutterLogo()),
          Switch(
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,

              value: themeNotifier.darkTheme,
              onChanged: (bool value) {
                themeNotifier.darkTheme = value;
              })
        ],
      ),
    );
  }
}
