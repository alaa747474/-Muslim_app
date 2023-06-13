import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dubisign_task/core/constants/app_assets.dart';
import 'package:dubisign_task/features/surahs/data/models/surah.dart';


class SurahCard extends StatelessWidget {
  const SurahCard({
    Key? key,
    required this.surah,
  }) : super(key: key);
 final Surah surah;
  @override
  Widget build(BuildContext context) {
    return  Container(
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.only(left: 10.r, right: 10.r, top: 10.r),
          width: double.maxFinite,
          height: 70.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  radius: 30.r,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.1),
                  child: Image.asset(
                    AppAssets.moshaf,
                    width: 40.w,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   surah.name!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    ' رقم السورة ${surah.number}',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    surah.revelationType=='Meccan'? 'مكية':'مدنية',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    'عدد الايات ${surah.ayahs.length}',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ],
          ),
        );
    
    
  }
}
