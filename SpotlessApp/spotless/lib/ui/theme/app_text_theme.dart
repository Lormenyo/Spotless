import 'package:spotless/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

TextTheme spotlessLightTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineLarge: base.headlineLarge!.copyWith(
          fontSize: 32.0,
          height: 1.25,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: base.headlineMedium!.copyWith(
          fontSize: 28.0,
          height: 1.25,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: base.headlineSmall!.copyWith(
          fontSize: 16.0,
          height: 1.125,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600,
        ),
        bodySmall: base.bodySmall!.copyWith(
          fontSize: 14.0,
          height: 1.2,
          fontFamily: 'Metropolis',
        ),
        bodyLarge: base.bodyLarge!.copyWith(
          fontSize: 14.0,
          height: 1.2,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: base.bodyMedium!.copyWith(
          fontSize: 12.0,
          height: 1.17,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w200,
        ),
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
