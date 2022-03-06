import 'package:flutter/material.dart';

import 'admin/add_doctors_details.dart';
import 'admin/admin_homepage.dart';
import 'login_screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            // ignore: deprecated_member_use
            backgroundColor: Color(0xfff7892b),
            iconTheme: IconThemeData(color: Colors.white)),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainLoginScreen(),
    );
  }
}
