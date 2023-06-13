import 'package:dubisign_task/core/constants/app_routes.dart';
import 'package:dubisign_task/features/surahs/data/models/surah.dart';
import 'package:dubisign_task/features/surahs/presentation/cubit/surah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedVersesListView extends StatelessWidget {
  const SavedVersesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        return ReorderableListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              key: ValueKey(index),
              padding: EdgeInsets.all(5.r),
              child: ListTile(
                onTap: () {
                  Surah surah = state.surahs
                      .where((element) =>
                          element.ayahs.contains(state.saveVerses[index]))
                      .first;
                  Navigator.pushNamed(context, AppRoutes.surahDetailsScreen,
                      arguments: surah);
                },
                tileColor: Theme.of(context).cardColor,
                title: Text(
                  state.saveVerses[index].text!,
                ),
                leading: Text('${index + 1}',style: Theme.of(context).textTheme.bodyMedium,),
              ),
            );
          },
          itemCount: state.saveVerses.length,
          onReorder: (oldIndex, newIndex) {
            context.read<SurahCubit>().changeSavedVersesListOrder(
                oldIndex: oldIndex, newIndex: newIndex);
          },
        );
      },
    );
  }
}
