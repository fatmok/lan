import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 导入日期格式化包

import 'bottom_nav_bar.dart'; // 导入 BottomNavBar 组件
import 'sales_shipment_model.dart';
import 'sales_shipment_service.dart';

class SalesShipmentsPage extends StatefulWidget {
  const SalesShipmentsPage({super.key});

  @override
  _SalesShipmentsPageState createState() => _SalesShipmentsPageState();
}

class _SalesShipmentsPageState extends State<SalesShipmentsPage> {
  Future<SalesShipmentList>? futureSalesShipments;
  final int _selectedIndex = 1; // 设置默认选中的索引
  bool _onlyShowNotReady = true;
  DateTime? _selectedDate;
  String _companyName = '';
  String _apiUrl = ''; // 用于存储 API URL

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/company');
    } else if (index == 1) {
      // Stay on this page
    } else if (index == 2) {
      Navigator.pushNamed(
        context,
        '/profile',
        arguments: {'loginName': 'WS01', 'companyName': _companyName},
      );
    } else if (index == 3) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _companyName = ModalRoute.of(context)!.settings.arguments as String;
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _fetchShipments() {
    setState(() {
      _apiUrl = SalesShipmentService().constructApiUrl(
        _companyName,
        _onlyShowNotReady,
        _selectedDate != null
            ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
            : '',
      );
      futureSalesShipments = SalesShipmentService().getSalesShipments(
        _companyName,
        _onlyShowNotReady,
        _selectedDate != null
            ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
            : '',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Shipments'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    '只顯示未完成',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Switch(
                  value: _onlyShowNotReady,
                  onChanged: (value) {
                    setState(() {
                      _onlyShowNotReady = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? '選擇日期'
                        : '選擇日期: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('選擇日期'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent, // 设置按钮的背景颜色为浅蓝色
              ),
              onPressed: _fetchShipments,
              child: const Text('取得資料'),
            ),
          ),
          if (_apiUrl.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('API URL: $_apiUrl', style: const TextStyle(fontSize: 16)),
            ),
          Expanded(
            child: futureSalesShipments == null
                ? const Center(
                    child: Text('Please select filters and fetch shipments.'))
                : FutureBuilder<SalesShipmentList>(
                    future: futureSalesShipments,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData ||
                          snapshot.data!.salesShipments.isEmpty) {
                        return const Center(child: Text('No data available'));
                      } else {
                        final salesShipments = snapshot.data!.salesShipments;
                        return ListView.builder(
                          itemCount: salesShipments.length,
                          itemBuilder: (context, index) {
                            final shipment = salesShipments[index];
                            return ListTile(
                              title: Text(shipment.noField),
                              subtitle: Text(
                                  '${shipment.sellToCustomerNameField}\n${shipment.shipToAddressField}'),
                              trailing: Text(shipment.statusField),
                              isThreeLine: true,
                            );
                          },
                        );
                      }
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
