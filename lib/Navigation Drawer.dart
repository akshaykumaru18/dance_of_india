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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: ListTile(
              title: Center(
                  child: Text(
                themeNotifier.darkTheme ?"Dark Mode On" : "Light Mode On",
                style: Theme.of(context).textTheme.headline1,
              )),
              trailing: Switch(
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.indigo,
                  value: themeNotifier.darkTheme,
                  onChanged: (bool value) {
                    themeNotifier.darkTheme = value;
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
