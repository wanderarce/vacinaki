import 'package:vacinaki/app/entities/inventory.dart';
import 'package:vacinaki/app/fakers/local_vaccines_faker.dart';

import 'base_repository.dart';

class VaccinesRepository extends BaseRepository {
  LocalVaccinesFaker faker = LocalVaccinesFaker();

  VaccinesRepository() {
    faker.init();
  }

  find() async {
    var response = await dio.get('vaccines');
  }

  findByTerm(String term) async {
    if (term.isEmpty) {
      return faker.localVaccines;
    } else {
      return faker.localVaccines
          .where((element) => compareElement(element, term))
          .toList();
    }
  }

  compareElement(Inventory element, String term) {
    String filter = term.toUpperCase();
    return element.local!.name!.contains(filter) ||
        element.vaccine!.name!.toUpperCase().contains(filter);
  }
}
