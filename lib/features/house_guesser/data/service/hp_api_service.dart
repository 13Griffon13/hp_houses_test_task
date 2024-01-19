import 'package:dio/dio.dart';
import 'package:test_task_hp_houses/features/house_guesser/data/service/hp_api_endpoints.dart';

class HPApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: HPApiEndpoints.baseUrl));

  static HPApiService instance = HPApiService._();

  HPApiService._();

  Future<List<dynamic>> getCharacters() async {
    final result = await _dio.get(HPApiEndpoints.characters);
    if (result.statusCode == 200) {
      return result.data;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> getCharacterById(String id) async {
    final result = await _dio.get(HPApiEndpoints.characterById(id));
    if (result.statusCode == 200) {
      return result.data[0];
    } else {
      throw Exception();
    }
  }
}
