import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_ordering_app/firebase_options.dart';
import 'package:food_ordering_app/pages/HomePages.dart';
import 'package:food_ordering_app/pages/SingIn.dart';
import 'package:food_ordering_app/pages/RegisterPage.dart';
import 'package:food_ordering_app/pages/FoodDescriptionPage.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: true, // Set to false to disable device preview
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context), // Add for locale support
      builder: DevicePreview.appBuilder, // Add for device preview
      routes: {
        '/home': (context) => HomePage(),
        '/signin': (context) => SignInPage(),
        '/register': (context) => RegisterPage(),
        '/mealDetail': (context) => MealDetailPage(mealId: ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}