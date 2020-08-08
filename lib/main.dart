import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/src/pages/home_page.dart';
import 'package:flutter_push_notifications/src/pages/mensaje_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //avigatorKey: navigatorKey,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext c) => HomePage(),
        'mensaje': (BuildContext c) => MensajePage(),
      },
    );
  }
}
