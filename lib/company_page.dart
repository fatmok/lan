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

  CompanyPage({super.key}); // 移除 const 构造函数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: companies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: MediaQuery.of(context).size.width -
                    16,
                child: Text(
                  companies[index],
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ), // Set button width to screen width minus padding
              ),
            );
          },
        ),
      ),
    );
  }
}
