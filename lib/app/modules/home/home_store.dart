import 'package:flutter_triple/flutter_triple.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vacinaki/app/entities/unities.dart';
import 'package:vacinaki/app/repositories/unities_repository.dart';
import 'package:vacinaki/app/services/location_service.dart';
import 'package:vacinaki/app/services/unities_service.dart';

class HomeStore extends NotifierStore<Exception, List<Unities>> {
  HomeStore() : super(<Unities>[]);

  final UnitiesService _unitiesService = UnitiesService();
  final UnitiesRepository _repository = UnitiesRepository();
  final LocationService _locationService = LocationService();
  LatLng? center;
  bool visible = false;

  List<Marker> markers = []; // CLASS MEMBER, MAP OF MARKS

  Future<void> find(String term) async {
    setLoading(true);

    List<Unities> value = [];
    if (term.isNotEmpty && term.length > 2) {
      value = await _unitiesService.findByTerm(term);
    }
    update(value);

    setLoading(false);
  }

  Future<Placemark?> location() async {
    Position position = await _locationService.determinePosition();
    setCenter(position);
    return await getPlace(position);
  }

  setIsVisible(bool visible) {
    this.visible = visible;
  }

  setCenter(Position position) {
    center = LatLng(position.latitude, position.longitude);
  }

  Future<Placemark?> getPlace(Position position) async {
    return await _locationService.getByCoordinates(position);
  }
}
