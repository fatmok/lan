class SalesShipment {
  bool dispatchedField;
  bool dispatchedFieldSpecified;
  String? handledByField;
  String keyField;
  String noField;
  String? numberPlateField;
  String sellToCustomerNameField;
  String sellToCustomerName2Field;
  String sellToCustomerNoField;
  String shipToAddressField;
  String shipToAddress2Field;
  String? shipToAddress2ChineseField;
  String shipToAddressChineseField;
  DateTime shipmentDateField;
  bool shipmentDateFieldSpecified;
  String statusField;
  bool statusFieldSpecified;

  SalesShipment({
    required this.dispatchedField,
    required this.dispatchedFieldSpecified,
    this.handledByField,
    required this.keyField,
    required this.noField,
    this.numberPlateField,
    required this.sellToCustomerNameField,
    required this.sellToCustomerName2Field,
    required this.sellToCustomerNoField,
    required this.shipToAddressField,
    required this.shipToAddress2Field,
    this.shipToAddress2ChineseField,
    required this.shipToAddressChineseField,
    required this.shipmentDateField,
    required this.shipmentDateFieldSpecified,
    required this.statusField,
    required this.statusFieldSpecified,
  });

  factory SalesShipment.fromJson(Map<String, dynamic> json) {
    return SalesShipment(
      dispatchedField: json['dispatchedField'] ?? false,
      dispatchedFieldSpecified: json['dispatchedFieldSpecified'] ?? false,
      handledByField: json['handled_byField'] as String?,
      keyField: json['keyField'] ?? '',
      noField: json['noField'] ?? '',
      numberPlateField: json['number_PlateField'] as String?,
      sellToCustomerNameField: json['sell_to_Customer_NameField'] ?? '',
      sellToCustomerName2Field: json['sell_to_Customer_Name_2Field'] ?? '',
      sellToCustomerNoField: json['sell_to_Customer_NoField'] ?? '',
      shipToAddressField: json['ship_to_AddressField'] ?? '',
      shipToAddress2Field: json['ship_to_Address_2Field'] ?? '',
      shipToAddress2ChineseField:
          json['ship_to_Address_2_ChineseField'] as String?,
      shipToAddressChineseField: json['ship_to_Address_ChineseField'] ?? '',
      shipmentDateField: DateTime.parse(
          json['shipment_DateField'] ?? DateTime.now().toIso8601String()),
      shipmentDateFieldSpecified: json['shipment_DateFieldSpecified'] ?? false,
      statusField: json['statusField']?.toString() ?? '',
      statusFieldSpecified: json['statusFieldSpecified'] ?? false,
    );
  }
}

class SalesShipmentList {
  List<SalesShipment> salesShipments;

  SalesShipmentList({required this.salesShipments});

  factory SalesShipmentList.fromJson(List<dynamic> parsedJson) {
    final shipments =
        parsedJson.map((json) => SalesShipment.fromJson(json)).toList();
    return SalesShipmentList(salesShipments: shipments);
  }
}
