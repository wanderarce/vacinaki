import 'package:vacinaki/app/entities/inventory.dart';
import 'package:vacinaki/app/services/unities_service.dart';

import 'base_repository.dart';

class InventoryRepository extends BaseRepository {
  final UnitiesService _unitiesService = UnitiesService();
  find() async {
    var response = await dio.get('inventories');
  }

  findByTerm(String term) async {
    return _unitiesService.findByTerm(term);
  }

  compareElement(Inventory element, String term) {
    String filter = term.toUpperCase();
    return element.local!.name!.contains(filter) ||
        element.vaccine!.name!.toUpperCase().contains(filter);
  }
}
