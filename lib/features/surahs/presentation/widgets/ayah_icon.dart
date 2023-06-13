import 'package:dubisign_task/core/constants/app_assets.dart';
import 'package:dubisign_task/features/surahs/presentation/cubit/surah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AyahIcon extends StatelessWidget {
  const AyahIcon({super.key, required this.ayahNumber});
  final String ayahNumber;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(2.r),
          width: state.fontSize! + 10.r,
          height: state.fontSize! + 10.r,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.ayahIcon),
                  fit: BoxFit.scaleDown)),
          child: Center(
              child: Text(
            ayahNumber,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: state.fontSize! - 10.sp),
          )),
        );
      },
    );
  }
}
