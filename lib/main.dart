
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/weather/data/repositories/WeatherRepo.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';
import 'features/weather/presentation/pages/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Eagle Weather",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.teal[800],
        body: BlocProvider(
          create: (context) => WeatherBloc(
            WeatherRepo(),
          ),
          child: SearchPage(),
        ),
      ),
    );
  }
}
