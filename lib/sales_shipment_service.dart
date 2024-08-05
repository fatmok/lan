import 'dart:convert';

import 'package:http/http.dart' as http;

import 'sales_shipment_model.dart';

class SalesShipmentService {
  String constructApiUrl(
      String company, bool onlyShowNotReady, String dateFilter) {
    final String encodedCompany = Uri.encodeComponent(company);
    final String onlyShowNotReadyParam = onlyShowNotReady ? '1' : '0';
    return 'http://183.178.18.147:19100/api/salesshipment?ShipmentNo=&company=$encodedCompany&Onlyshownotready=$onlyShowNotReadyParam&DateFilter=$dateFilter';
  }

  Future<SalesShipmentList> getSalesShipments(
      String company, bool onlyShowNotReady, String dateFilter) async {
    final String url = constructApiUrl(company, onlyShowNotReady, dateFilter);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return SalesShipmentList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load sales shipments');
    }
  }
}
