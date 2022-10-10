import 'package:dio/dio.dart';
import 'package:vacinaki/app/entities/vaccine.dart';
import 'package:vacinaki/app/repositories/vaccines_repository.dart';

class VaccinesService {
  final VaccinesRepository _vaccinesRepository = VaccinesRepository();

  Future findByTerm(String term) async {
    Response response = await _vaccinesRepository.findByTerm(term);
    List<Vaccine> vaccines = [];
    if (response.statusCode == 200) {
      vaccines =
          List.from(response.data).map((e) => Vaccine.fromJson(e)).toList();
    }
    return vaccines;
  }
}
