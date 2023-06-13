import 'package:dubisign_task/features/surahs/data/models/surah.dart';

abstract class BaseSurahsRepository {
  Future<List<Surah>>getAllSurahs();
}