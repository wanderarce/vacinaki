import 'package:dio/dio.dart';
import 'package:vacinaki/app/entities/unities.dart';
import 'package:vacinaki/app/repositories/unities_repository.dart';

class UnitiesService {
  final UnitiesRepository _unitiesRepository = UnitiesRepository();

  Future findByTerm(String term) async {
    Response response = await _unitiesRepository.findByTerm(term);
    List<Unities> unities = [];
    if (response.statusCode == 200) {
      unities =
          List.from(response.data).map((e) => Unities.fromJson(e)).toList();
    }
    return unities;
  }
}
