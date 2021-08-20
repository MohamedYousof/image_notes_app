import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_notes/controller/providers/notes_provider.dart';
import 'package:image_notes/screens/home_screen.dart';
import 'package:image_notes/screens/login_screen.dart';
import 'package:image_notes/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> mainColor = {
      50: Color.fromRGBO(178, 223, 219, .1),
      100: Color.fromRGBO(178, 223, 219, .2),
      200: Color.fromRGBO(178, 223, 219, .3),
      300: Color.fromRGBO(178, 223, 219, .4),
      400: Color.fromRGBO(178, 223, 219, .5),
      500: Color.fromRGBO(178, 223, 219, .6),
      600: Color.fromRGBO(178, 223, 219, .7),
      700: Color.fromRGBO(178, 223, 219, .8),
      800: Color.fromRGBO(178, 223, 219, .9),
      900: Color.fromRGBO(178, 223, 219, 1),
    };
    MaterialColor customColor = MaterialColor(0xFFB2DFDB, mainColor);
    return ChangeNotifierProvider(
        create: (BuildContext context) => NotesProvider(),
        child: MaterialApp(
          title: 'Image Notes',
          theme: ThemeData(
            primarySwatch: customColor,
            accentColor: Colors.white,
            buttonColor: Color(0xFF39796B),
            tabBarTheme: TabBarTheme(labelColor: Colors.white),
          ),
          home: HomeScreen(),
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (ctx) => SplashScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
          },
        ));
  }
}
