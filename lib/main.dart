import 'package:assessment/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              primary: Colors.black,
              secondary: Colors.white,
              tertiary: Colors.pink,
              onPrimary: Colors.white,
              onSecondary: Colors.black,
              onTertiary: Colors.black,
              scrim: const Color.fromRGBO(58, 58, 58, 1),
              surface: const Color.fromRGBO(14, 13, 13, 1)),
          scaffoldBackgroundColor: const Color.fromRGBO(14, 13, 13, 1),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            labelMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
            labelLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            titleSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            titleMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            titleLarge: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          )),
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute));
}
