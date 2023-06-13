import 'package:dio/dio.dart';
import 'package:dubisign_task/core/constants/end_points.dart';
import 'package:dubisign_task/features/surahs/data/models/surah.dart';
import 'package:dubisign_task/features/surahs/data/repositories/base_surahs_repository.dart';

class SurahsRepository implements BaseSurahsRepository {
  final Dio _dio;

  SurahsRepository(this._dio);
  @override
  Future<List<Surah>> getAllSurahs() async {
    Response response = await _dio.get(EndPoints.quran);
    List<dynamic> data = response.data['data']['surahs'];
    return data.map((surah) => Surah.fromJson(surah)).toList();
  }
}
