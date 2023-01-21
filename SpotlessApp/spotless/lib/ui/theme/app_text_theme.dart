import 'package:spotless/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

TextTheme spotlessLightTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline1: base.headline1!.copyWith(
          fontSize: 32.0,
          height: 1.25,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700,
        ),
        headline2: base.headline2!.copyWith(
          fontSize: 28.0,
          height: 1.25,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700,
        ),
        headline3: base.headline3!.copyWith(
          fontSize: 16.0,
          height: 1.125,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700,
        ),
        headline4: base.headline4!.copyWith(
          fontSize: 14.0,
          height: 1.14,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700,
        ),
        subtitle1: base.headline3!.copyWith(
          fontSize: 14.0,
          height: 1.2,
          fontFamily: 'Metropolis',
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontSize: 14.0,
          height: 1.2,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
        bodyText2: base.bodyText2!.copyWith(
          fontSize: 12.0,
          height: 1.17,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w200,
        ),
        button: base.button!.copyWith(
          fontSize: 14.0,
          height: 1.2,
          fontFamily: 'Metropolis',
        ),
        caption: base.caption!.copyWith(
          fontSize: 10.0,
          height: 1.2,
          fontFamily: 'Metropolis',
        ),
        overline: base.overline!
            .copyWith(fontWeight: FontWeight.normal, fontFamily: 'Metropolis'),
      )
      .apply(
        displayColor: AppColors.spotlessBlack,
        bodyColor: AppColors.spotlessBlack,
      );
}

extension CustomspotlessText on TextTheme {
  TextStyle get spotlessText700 {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Metropolis',
    );
  }

  TextStyle get spotlessText600 {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Metropolis',
    );
  }

  TextStyle get spotlessText500 {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Metropolis',
    );
  }

  TextStyle get spotlessText400 {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Metropolis',
    );
  }

  TextStyle get spotlessText200 {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200,
      fontFamily: 'Metropolis',
    );
  }
}
