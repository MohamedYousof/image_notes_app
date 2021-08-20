import 'package:flutter/material.dart';
import 'package:image_notes/controller/helpers/shared_prefs.dart';
import 'package:image_notes/widgets/logo.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      SharedData().getLoginData().then((value) {
        if (value['token'] == null) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
