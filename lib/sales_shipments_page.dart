import 'package:flutter/material.dart';
import 'sales_shipment_service.dart';
import 'sales_shipment_model.dart';

class SalesShipmentsPage extends StatefulWidget {
  const SalesShipmentsPage({Key? key}) : super(key: key);

  @override
  _SalesShipmentsPageState createState() => _SalesShipmentsPageState();
}

class _SalesShipmentsPageState extends State<SalesShipmentsPage> {
  late Future<SalesShipmentList> futureSalesShipments;

  @override
  void initState() {
    super.initState();
    futureSalesShipments = SalesShipmentService().getSalesShipments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Shipments'),
      ),
      body: FutureBuilder<SalesShipmentList>(
        future: futureSalesShipments,
        builder: (context, snapshot) {
          print(
              'FutureBuilder snapshot: ${snapshot.data}'); // 打印 FutureBuilder 的快照数据
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
    );
  }
}
