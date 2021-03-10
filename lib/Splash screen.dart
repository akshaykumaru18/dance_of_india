import 'package:dance_of_india/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  SplashScreenAnimationController splashScreenAnimation;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));



    splashScreenAnimation = SplashScreenAnimationController(_controller);
    splashScreenAnimation.controller.addListener(() {
      if(splashScreenAnimation.controller.isCompleted){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_)=> MyHomePage(title: "Dance of India",)
        ));
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: splashScreenAnimation.controller,
            builder: (context,child){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Todo :  Display App logo, apply opacity animation to it
                  Opacity(
                    opacity: splashScreenAnimation.appLogoOpacity.value,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/logo/plain logo.jpg",
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  //Todo : Show the App Name, Animate with ease In animation
                  Opacity(
                    opacity: splashScreenAnimation.appTitleOpacity.value,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Dance ",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(color: Color(0xFFFF9933), fontSize: 35)),
                        TextSpan(
                            text: "of ",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(color: Color(0xFF000080), fontSize: 35)),
                        TextSpan(
                            text: "India",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(color: Color(0xFF138808), fontSize: 35)),
                      ]),
                    ),
                  ),
                  //Todo : Show Tag line , Animate with ease in after the app name comes
                  Opacity(
                    opacity: splashScreenAnimation.appTagLineOpacity.value,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Feel the Rythem",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            color: Colors.redAccent,
                            fontFamily: "Allura",
                            fontSize: 35,
                            letterSpacing: 1.5),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class SplashScreenAnimationController {
  SplashScreenAnimationController(this.controller)
      : appLogoOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.6, curve: Curves.easeIn))),
        appTitleOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.2, 0.7, curve: Curves.decelerate))),
        appTagLineOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.3, 0.8, curve: Curves.decelerate)));

  final AnimationController controller;
  final Animation<double> appLogoOpacity;
  final Animation<double> appTitleOpacity;
  final Animation<double> appTagLineOpacity;
}
