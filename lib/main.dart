import 'package:flutter/material.dart';
import 'sales_shipments_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Shipments',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SalesShipmentsPage(), // 确保传递 key 参数
    );
  }
}
