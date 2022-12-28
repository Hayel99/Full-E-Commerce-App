import 'package:ecommerce_app/providers/home_screen_provider.dart';
import 'package:ecommerce_app/providers/item_scren_provider.dart';
import 'package:ecommerce_app/views/home_page.dart';
import 'package:ecommerce_app/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_view/splash_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context) => ItemsScreenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashView(
          backgroundColor: Colors.white,
          duration: Duration(seconds: 3),
          logo: Image.asset("assets/images/logo.jpeg"),
          done: Done(LoginScreen())),
    );
  }
}
