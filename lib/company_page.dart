import 'package:flutter/material.dart';

class CompanyPage extends StatelessWidget {
  final List<String> companies = [
    'Company A',
    'Company B',
    'Company C',
    'Company D',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Companies')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: companies.map((company) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  // Handle button press
                },
                child: Text(company),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
