import 'package:vacinaki/app/entities/vaccine.dart';

import 'unities.dart';

class Inventory {
  Unities? local;
  Vaccine? vaccine;
  int? quantity;

  Inventory({this.local, this.vaccine, this.quantity});

  Inventory.fromJson(Map<String, dynamic> json) {
    local = json['local'] != null ? Unities.fromJson(json['local']) : null;
    vaccine =
        json['vaccine'] != null ? Vaccine.fromJson(json['vaccine']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (local != null) {
      data['local'] = local?.toJson();
    }
    if (vaccine != null) {
      data['vaccine'] = vaccine?.toJson();
    }
    data['quantity'] = quantity;
    return data;
  }
}
