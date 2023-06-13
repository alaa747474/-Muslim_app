import 'package:dubisign_task/features/surahs/data/models/ayah.dart';
import 'package:dubisign_task/features/surahs/presentation/cubit/surah_cubit.dart';
import 'package:dubisign_task/features/surahs/presentation/widgets/ayah_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:dubisign_task/features/surahs/data/models/surah.dart';
import 'package:dubisign_task/features/surahs/presentation/widgets/font_size_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurahDetailsScreen extends StatelessWidget {
  const SurahDetailsScreen({
    Key? key,
    required this.surah,
  }) : super(key: key);
  final Surah surah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القرآن الكريم'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'حجم الخط',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const FontSizeSlider(),
            BlocBuilder<SurahCubit, SurahState>(
              builder: (context, state) {
                return Expanded(
                    child: ListView(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      for (Ayah ayah in surah.ayahs)
                        TextSpan(
                          children: [
                            WidgetSpan(
                                child: AyahIcon(
                              ayahNumber: ayah.numberInSurah.toString(),
                            )),
                          ],
                          text: ayah.text!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: state.fontSize),
                          recognizer: LongPressGestureRecognizer()
                            ..onLongPress = () {
                              context
                                  .read<SurahCubit>()
                                  .addAyahToSavedList(ayah: ayah);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      content: const Text(
                                          'تم إضافة الآية الي المحفوظات')));
                            },
                        ),
                    ])),
                  ],
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
