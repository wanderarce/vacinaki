import 'package:dio/dio.dart';

class BaseRepository {
  final Dio dio = Dio();

  BaseRepository() {
    dio.options.baseUrl = "https://vacinas-puc.herokuapp.com/";
  }
}
