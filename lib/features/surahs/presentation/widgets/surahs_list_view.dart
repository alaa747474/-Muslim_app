import 'package:dubisign_task/core/constants/app_routes.dart';
import 'package:dubisign_task/core/utils/enums.dart';
import 'package:dubisign_task/core/widgets/loading_indicator.dart';
import 'package:dubisign_task/features/surahs/presentation/cubit/surah_cubit.dart';
import 'package:dubisign_task/features/surahs/presentation/widgets/surah_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahsListView extends StatelessWidget {
  const SurahsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state.surahsRequestState == RequestState.loading) {
          return const LoadingIndicator();
        }
        if (state.surahsRequestState == RequestState.loaded) {
          return ListView.builder(
            itemCount: state.surahs.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.surahDetailsScreen,
                        arguments: state.surahs[index]);
                  },
                  child: SurahCard(
                    surah: state.surahs[index],
                  ));
            },
          );
        }
        return const Text('ERROR');
      },
    );
  }
}
