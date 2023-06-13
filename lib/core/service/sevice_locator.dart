import 'package:dio/dio.dart';
import 'package:dubisign_task/core/constants/end_points.dart';
import 'package:dubisign_task/features/surahs/data/repositories/base_surahs_repository.dart';
import 'package:dubisign_task/features/surahs/data/repositories/surahs_repository.dart';
import 'package:dubisign_task/features/surahs/presentation/cubit/surah_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
setUpServiceLocator() {
  getIt.registerLazySingleton<BaseSurahsRepository>(
      () => SurahsRepository(dioSetUp()));
  getIt.registerFactory<SurahCubit>(() => SurahCubit(getIt.get<BaseSurahsRepository>()));    
}

Dio dioSetUp() {
  Dio dio = Dio();
  dio
    ..options.baseUrl = EndPoints.baseUrl
    ..options.connectTimeout = const Duration(seconds: 40)
    ..options.receiveTimeout = const Duration(seconds: 40);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: true,
    responseHeader: true,
    request: true,
    requestBody: false,
  ));

  return dio;
}
