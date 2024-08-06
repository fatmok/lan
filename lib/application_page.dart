import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart'; // 确保导入 BottomNavBar 组件

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/company');
    } else if (index == 1) {
      // Stay on this page
    } else if (index == 2) {
      Navigator.pushNamed(
        context,
        '/profile',
        arguments: {
          'loginName': 'WS01',
          'companyName': ModalRoute.of(context)!.settings.arguments as String
        },
      );
    } else if (index == 3) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  final List<String> applications = [
    'Stock Receipt 入庫單',
    'Picking List 出庫單',
    'Self Pickup 自取/代送',
    'Cargo Receipt 收貨確認',
    'Sales Shipment 出貨單',
  ];

  @override
  Widget build(BuildContext context) {
    final String companyName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Applications'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Text('Selected Company: $companyName',
              style: TextStyle(fontSize: 24)),
          Expanded(
            child: ListView.builder(
              itemCount: applications.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {
                      if (applications[index] == 'Sales Shipment 出貨單') {
                        Navigator.pushNamed(
                          context,
                          '/salesShipment',
                          arguments: companyName,
                        );
                      } else {
                        // Handle other button presses
                      }
                    },
                    color: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      applications[index],
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
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
