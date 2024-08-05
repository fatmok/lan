import 'dart:convert';
import 'package:http/http.dart' as http;
import 'sales_shipment_model.dart';

class SalesShipmentService {
  final String apiUrl =
      'http://183.178.18.147:19100/api/salesshipment?ShipmentNo=&company=AIO%20Shop%20Limited&Onlyshownotready=1&DateFilter=..01/07/2024';

  Future<SalesShipmentList> getSalesShipments() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print('JSON Response: ${response.body}'); // 打印原始 JSON 数据
      final jsonData = json.decode(response.body);
      print('Parsed JSON: $jsonData'); // 打印解析后的 JSON 数据
      final salesShipmentList = SalesShipmentList.fromJson(jsonData);
      print(
          'Parsed SalesShipmentList: ${salesShipmentList.salesShipments}'); // 打印解析后的 SalesShipmentList
      return salesShipmentList;
    } else {
      throw Exception('Failed to load sales shipments');
    }
  }
}
