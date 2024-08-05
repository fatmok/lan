import 'package:flutter/material.dart';
import 'login_page.dart';
import 'company_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MES Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage1(),
        '/company': (context) => CompanyPage(),
      },
    );
  }
}
