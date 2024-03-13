import 'package:flutter/material.dart';
import 'package:tarea6_flutter/front_page.dart';
import 'package:tarea6_flutter/pages/get_forecast.dart';
import 'package:tarea6_flutter/pages/get_gender.dart';
import 'package:tarea6_flutter/pages/get_universities.dart';
import 'package:tarea6_flutter/pages/get_worpress_info.dart';
import 'package:tarea6_flutter/pages/get_years_old.dart';
import 'package:tarea6_flutter/pages/hire_me.dart';
import 'package:tarea6_flutter/pages/home_page.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FrontPage(),
      routes: {
        '/homePage': (context) => const HomePage(),
        '/forecast': (context) => ApiWeather(),
        '/gender': (context) => const ApiGender(),
        '/universities': (context) => const ApiUniversities(),
        '/worpressInfo': (context) => ApiWorpressWeb(),
        '/yearsOld': (context) => const ApiYearsOld(),
        '/hireMePage': (context) => const HireMePage(),
      },
    );
  }
}
