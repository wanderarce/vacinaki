import 'package:dio/dio.dart';
import 'package:vacinaki/app/entities/inventory.dart';

import '../repositories/inventory_repository.dart';

class InventoryService {
  final InventoryRepository _unitiesRepository = InventoryRepository();

  Future findByTerm(String term) async {
    Response response = await _unitiesRepository.findByTerm(term);
    List<Inventory> unities = [];
    if (response.statusCode == 200) {
      unities =
          List.from(response.data).map((e) => Inventory.fromJson(e)).toList();
    }
    return unities;
  }
}
