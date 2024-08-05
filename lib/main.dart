import 'package:flutter/material.dart';

import 'application_page.dart';
import 'company_page.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'sales_shipments_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/company': (context) => CompanyPage(),
        '/application': (context) => ApplicationPage(),
        '/salesShipment': (context) => SalesShipmentsPage(),
        '/profile': (context) => ProfilePage(
              loginName: (ModalRoute.of(context)!.settings.arguments
                  as Map)['loginName'],
              companyName: (ModalRoute.of(context)!.settings.arguments
                  as Map)['companyName'],
            ),
      },
    );
  }
}
