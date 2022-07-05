import 'package:flutter/material.dart';
import 'package:mezcal/home.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //the root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mezcal',
      theme: ThemeData(
        secondaryHeaderColor: Colors.amber[100],
        backgroundColor: const Color.fromARGB(255, 251, 249, 241),
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber,
        primaryTextTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      // darkTheme: ThemeData.dark(),
      home: const Home(),
    );
  }
}
