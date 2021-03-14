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
                themeNotifier.darkTheme ? "Dark Mode On" : "Light Mode On",
                style: Theme.of(context).textTheme.headline1,
              )),
              trailing: Container(
               // width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Switch(
                  splashRadius: 5,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.yellow,
                    activeColor: Colors.transparent,
                    //inactiveThumbColor: Colors.indigo,
                    value: themeNotifier.darkTheme,
                    activeThumbImage: AssetImage("assets/icons/moon.png"),
                    inactiveThumbImage: AssetImage("assets/icons/sun.png"),
                    onChanged: (bool value) {
                      themeNotifier.darkTheme = value;
                    }),
              ),
      
            ),
          ),
        ],
      ),
    );
  }
}
