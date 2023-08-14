import 'package:flutter/material.dart';

import 'view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VirusGuard',
      // color: Colors.black45,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        primarySwatch: Colors.blue,
         brightness: Brightness.dark,
        primaryColor: Colors.red,
        // scaffoldBackgroundColor: Colors.black45, // isse all scaffold ka background color black ho jaiga ,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white70,
              displayColor: Colors.white70,
            ),
      ),
      home: const SplashScreen(),
    );
  }
}
