import 'dart:math';

import 'package:vacinaki/app/entities/unities.dart';
import 'package:vacinaki/app/entities/vaccine.dart';
import 'package:vacinaki/app/fakers/local_faker.dart';
import 'package:vacinaki/app/fakers/vaccine_faker.dart';

import '../entities/inventory.dart';

class LocalVaccinesFaker {
  List<Inventory> localVaccines = [];
  final LocalFaker _localFaker = LocalFaker();
  final VaccineFaker _vaccineFaker = VaccineFaker();
  init() {
    _localFaker.init();
    _vaccineFaker.init();

    List<Unities> locals = _localFaker.locals;
    List<Vaccine> vaccines = _vaccineFaker.vaccines;
    for (Unities element in locals) {
      for (Vaccine vac in vaccines) {
        localVaccines.add(Inventory(
            local: element, vaccine: vac, quantity: Random().nextInt(10)));
      }
    }
  }
}
