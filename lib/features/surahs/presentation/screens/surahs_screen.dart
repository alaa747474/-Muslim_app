
import 'package:dubisign_task/features/surahs/presentation/widgets/saved_verses_list_view.dart';
import 'package:dubisign_task/features/surahs/presentation/widgets/surahs_list_view.dart';
import 'package:flutter/material.dart';

class SurahsScreen extends StatelessWidget {
  const SurahsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('القرآن الكريم'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'السور',
                ),
                Tab(
                  text: 'المحفوظات',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SurahsListView(),
              SavedVersesListView()
            ],
          ),
        ));
  }
}
