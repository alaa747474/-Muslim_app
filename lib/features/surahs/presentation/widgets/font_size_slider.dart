import 'package:dubisign_task/features/surahs/presentation/cubit/surah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontSizeSlider extends StatelessWidget {
  const FontSizeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        return Slider(
            max: 30.sp,
            min: 14.sp,
            value: state.fontSize!.sp,
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).cardColor,
            onChanged:(value) {
              context.read<SurahCubit>().changeFontSize(value);
            },);
      },
    );
  }
}
