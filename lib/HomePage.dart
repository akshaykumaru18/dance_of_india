import 'package:dance_of_india/Navigation%20Drawer.dart';
import 'package:dance_of_india/Utils/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          children: [
            FlutterLogo(),
            Text(
              "Feel the Rythem",
              style: Theme.of(context).textTheme.headline1.copyWith(
                  //color: Colors.redAccent,
                  fontFamily: "Allura",
                  fontSize: 35,
                  letterSpacing: 1.5),
            ),

          ],
        ),

      ),
    );
  }
}