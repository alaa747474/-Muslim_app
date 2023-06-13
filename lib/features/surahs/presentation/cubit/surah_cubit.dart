import 'package:bloc/bloc.dart';
import 'package:dubisign_task/features/surahs/data/models/ayah.dart';
import 'package:dubisign_task/features/surahs/data/repositories/base_surahs_repository.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../data/models/surah.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this._baseSurahsRepository) : super(const SurahState());
  final BaseSurahsRepository _baseSurahsRepository;
  void getAllSurahs() {
    _baseSurahsRepository.getAllSurahs().then((surahs) {
      emit(state.copyWith(
          surahsRequestState: RequestState.loaded, surahs: surahs));
    });
  }

  void changeFontSize(double fontSize) {
    emit(state.copyWith(fontSize: fontSize));
  }

  void addAyahToSavedList({required Ayah ayah}) {
    emit(state.copyWith(
        saveVerses: List.from(state.saveVerses.toList())..add(ayah)));
  }

  void changeSavedVersesListOrder(
      {required int oldIndex, required int newIndex}) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final Ayah ayah = state.saveVerses.removeAt(oldIndex);
    state.saveVerses.insert(newIndex, ayah);
  }
}
