import 'package:vacinaki/app/entities/inventory.dart';

import 'base_repository.dart';

class VaccinesRepository extends BaseRepository {
  find(String term) async {
    var response = await dio.get('vaccines');
  }

  compareElement(Inventory element, String term) {
    String filter = term.toUpperCase();
    return element.local!.name!.contains(filter) ||
        element.vaccine!.name!.toUpperCase().contains(filter);
  }
}
