import 'package:dance_of_india/HomePage.dart';
import 'package:dance_of_india/Splash%20screen.dart';
import 'package:dance_of_india/Utils/ThemeDataStyle.dart';
import 'package:dance_of_india/Utils/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = new ThemeProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeProvider.darkTheme = await themeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_){
        return themeProvider;
      },
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context,value, Widget child){
          return  MaterialApp(
            title: 'Dance of India',
            debugShowCheckedModeBanner: false,
            theme: ThemeDataStyle.themeData(themeProvider.darkTheme, context),
            //home: SplashScreen()
            home: MyHomePage(title: 'Dance of India'),
          );
        },
      )
    );
  }
}
