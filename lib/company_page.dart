import 'package:flutter/material.dart';

class CompanyPage extends StatelessWidget {
  final List<String> companies = [
    'AIO Shop Limited',
    'Lingwei (Tainjin) Co Ltd',
    'MAS_LIV_bkp',
    'MES (Tianjin) Steel Pipe Ltd',
    'MES Cable Management Sys Ltd',
    'Michelle_LIV',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Companies'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: companies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/application',
                    arguments: companies[index],
                  );
                },
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  companies[index],
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: MediaQuery.of(context).size.width -
                    16, // Set button width to screen width minus padding
              ),
            );
          },
        ),
      ),
    );
  }
}
