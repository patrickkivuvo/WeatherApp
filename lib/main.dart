import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/screens/cities_screen.dart';
void main() {
  Paint.enableDithering = true;
  runApp(
      const ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const buttonColor = Color.fromRGBO(36, 54, 113, 1);
    const iconColor = Color.fromRGBO(17, 49, 117, 1);
    const accentColor = Color.fromRGBO(255, 255, 255, 1);
    const splashColor = Color.fromRGBO(0, 0, 0, .3);
    const focusColor = Color.fromRGBO(0, 0, 0, 1);
    const primaryColor = Color.fromRGBO(236, 108, 5, 1);
    const headingColors = Colors.white;
    const headingMediumColors = Color.fromRGBO(204, 202, 220, 1);
    const headingSmallColors = Color.fromRGBO(94, 88, 145, 1);
    const textColors = Colors.white;
    const textTheme = TextTheme(
      displayLarge:  TextStyle(color: headingColors , fontSize: 28, ),

      displayMedium:
      TextStyle(color: headingMediumColors, fontWeight: FontWeight.w600, fontSize: 16),
      displaySmall:
      TextStyle(color: headingSmallColors, fontWeight: FontWeight.w500, fontSize: 12),
      headlineMedium:
      TextStyle(color: headingMediumColors, fontWeight: FontWeight.bold),
      headlineSmall:
      TextStyle(color: headingSmallColors, fontWeight: FontWeight.bold),
      titleLarge:
      TextStyle(color: headingColors, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(color: textColors),
      bodyLarge: TextStyle(color: textColors),
      bodyMedium: TextStyle(color: textColors),
    );



    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Inter',
          primaryColor: primaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(
           textTheme
          ) ,),
      home: const CitiesScreen()
    );

  }
}


