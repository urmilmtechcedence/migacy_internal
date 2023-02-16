import 'package:flutter/material.dart';
import 'package:migacy_app/resources/app_constants/app_constants.dart';
import 'package:migacy_app/resources/app_strings/app_strings.dart';
import 'package:migacy_app/resources/app_themes/app_themes.dart';
import 'package:sizer/sizer.dart';

import '../../resources/assets_path/assets_path.dart';

class IntroView extends StatelessWidget {
  final int position;
  final String message;
  final String assetsPath;
  final Function() onSkipListener;

  const IntroView(
      {super.key,
      required this.position,
      required this.message,
      required this.assetsPath,
      required this.onSkipListener});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(
              assetsPath,
              fit: BoxFit.fill,
            ),
            if (position == 0) ...[
              Positioned(
                top: 5.h,
                right: 5.w,
                child: GestureDetector(
                  onTap : onSkipListener,
                  child: Text(
                    AppStrings.strSkip,
                    style: AppConstants.normalTextStyle(
                        12.sp, AppThemes.lightBlueTextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
            Positioned(
              top: 23.h,
              right: position == 0 ? 5.w : 50.w,
              left: position == 0 ? 50.w : 5.w,
              child: Image.asset(
                position == 0 ? AssetsPath.introMessageOne : AssetsPath.introMessageTwo,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
        Text(
          message,
          style: AppConstants.normalTextStyle(12.sp, AppThemes.lightGrayTextColor),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
