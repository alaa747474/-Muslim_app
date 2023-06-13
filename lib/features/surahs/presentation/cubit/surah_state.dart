part of 'surah_cubit.dart';

class SurahState extends Equatable {
  final RequestState surahsRequestState;
  final List<Surah> surahs;
  final List<Ayah>saveVerses;
  final double ?fontSize;

  const SurahState({
    this.surahsRequestState = RequestState.loading,
    this.surahs = const [],
    this.saveVerses=const [],
    this.fontSize=20
  });
  SurahState copyWith({RequestState ?surahsRequestState, List<Surah>? surahs, double ?fontSize,List<Ayah>?saveVerses}) {
    return SurahState(
      surahsRequestState: surahsRequestState ??this.surahsRequestState,
      surahs: surahs??this.surahs,
      fontSize: fontSize??this.fontSize,
      saveVerses: saveVerses??this.saveVerses
    );
  }

  @override
  List<Object?> get props => [surahsRequestState, surahs,fontSize,saveVerses];
}
