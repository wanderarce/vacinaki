import 'package:vacinaki/app/entities/unities.dart';

class LocalFaker {
  List<Unities> locals = [];

  init() {
    Unities local = Unities(
        id: 1,
        name: "UBS Jockey Clube",
        address: "",
        latitude: 50.265,
        longitude: 54.655);
    locals.add(local);
    Unities local2 = Unities(
        id: 1,
        name: "UBS Aero Rancho",
        address: "",
        latitude: 50.265,
        longitude: 54.655);
    locals.add(local2);
    Unities local3 = Unities(
        id: 1,
        name: "UBS Pioneiros",
        address: "",
        latitude: 50.265,
        longitude: 54.655);
    locals.add(local3);
  }
}
