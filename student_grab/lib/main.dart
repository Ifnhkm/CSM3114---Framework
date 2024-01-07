import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_grab/models/user.dart';
import 'package:student_grab/widgets/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DriverList(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Grab Application',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 109, 155, 229),
        hintColor: Color.fromARGB(255, 252, 92, 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
