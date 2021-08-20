import 'package:flutter/material.dart';
import 'package:image_notes/widgets/login_form.dart';
import 'package:image_notes/widgets/logo.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(178, 223, 219, 0.75),
              Color.fromRGBO(178, 223, 219, 1),
            ],
            tileMode: TileMode.clamp,
            stops: [0.01, 0.6],
          ),
        ),
        width: double.infinity,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(
            //   child: Container(),
            // ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Logo(),
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
