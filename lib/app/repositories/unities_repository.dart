import 'package:vacinaki/app/entities/inventory.dart';

import 'base_repository.dart';

class UnitiesRepository extends BaseRepository {
  find() async {
    var response = await dio.get('vaccines');
  }

  findByTerm(String term) async {
    return await dio.get('unities/filter/$term');
  }

  compareElement(Inventory element, String term) {
    String filter = term.toUpperCase();
    return element.local!.name!.contains(filter) ||
        element.vaccine!.name!.toUpperCase().contains(filter);
  }
}
