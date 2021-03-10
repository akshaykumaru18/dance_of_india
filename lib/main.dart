import 'package:dance_of_india/Splash%20screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dance of India',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.red,
            textTheme: TextTheme(
                headline1: TextStyle(
                    fontFamily: "Roboto-Bold",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                headline3: TextStyle(
                    fontFamily: "Roboto-Medium",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                headline6: TextStyle(
                    fontFamily: "Roboto-Black",
                    fontSize: 18,
                    color: Colors.black))
            //fontFamily: "Roboto"
            ),
        home: SplashScreen()
        //home: MyHomePage(title: 'Dance of India'),
        );
  }
}

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
      ),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
