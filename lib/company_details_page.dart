import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart'; // 导入底部导航栏组件

class CompanyDetailsPage extends StatefulWidget {
  @override
  _CompanyDetailsPageState createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/company');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/application');
    } else if (index == 2) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final String companyName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Company Details'),
      ),
      body: Center(
        child: Text('Selected Company: $companyName',
            style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
