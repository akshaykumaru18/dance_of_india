
import 'package:dance_of_india/Screens/HomePage.dart';
import 'package:dance_of_india/Screens/Splash%20screen.dart';
import 'package:dance_of_india/Utils/ThemeDataStyle.dart';
import 'package:dance_of_india/Utils/ThemeProvider.dart';
import 'package:dance_of_india/logic/providers/DanceEventsProvider.dart';
import 'file:///C:/Users/Akshay%20Kumar%20U/AndroidStudioProjects/dance_of_india/lib/logic/providers/DanceFormsProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    themeProvider.darkTheme =
        await themeProvider.darkThemePreference.getTheme();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    DanceEventsProvider().dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return DanceFormsProvider();
          }),
          ChangeNotifierProvider(create: (_) {
            return themeProvider;
          }),
          ChangeNotifierProvider(create: (_) {
            return DanceEventsProvider();
          })
        ],
        child: Consumer<ThemeProvider>(
          builder: (BuildContext context, value, Widget child) {
            return MaterialApp(
              title: 'Dance of India',
              debugShowCheckedModeBanner: false,
              theme: ThemeDataStyle.themeData(themeProvider.darkTheme, context),
               //home: SplashScreen()
              home: MainPage(),
            );
          },
        ));
  }
}
