import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/utils/size_utils.dart';
import 'package:english_academy_mobile/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline text style
  static get headlineSmallHelenaJohnsmithGray800 =>
      theme.textTheme.headlineSmall!.helenaJohnsmith.copyWith(
        color: appTheme.gray800,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallMishella =>
      theme.textTheme.headlineSmall!.mishella.copyWith(
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.black900,
  );
  static get labelLargeBluegray200 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueGray200,
    fontWeight: FontWeight.w800,
  );
  static get labelLargeBluegray20012 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueGray200,
    fontSize: 12.fSize,
  );
  static get labelLargeBluegray900 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueGray900,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w800,
  );
  static get labelLargeBluegray900_1 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueGray900,
  );
  static get labelLargeExtraBold => theme.textTheme.labelLarge!.copyWith(
    fontWeight: FontWeight.w800,
  );
  static get labelLargeGray500 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray500,
  );
  static get labelLargeGray700 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray700.withOpacity(0.8),
  );
  static get labelLargeGray800 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray800,
    fontSize: 12.fSize,
  );
  static get labelLargeGray80001 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray80001,
    fontWeight: FontWeight.w800,
  );
  static get labelLargeJostBluegray900 =>
      theme.textTheme.labelLarge!.jost.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOrangeA700 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.orangeA700,
    fontSize: 12.fSize,
  );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.primary,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w800,
  );
  static get labelLargeTeal700 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.teal700,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w800,
  );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.whiteA700,
  );
  static get labelLargeWhiteA70012 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.whiteA700,
    fontSize: 12.fSize,
  );
  static get labelLargeWhiteA700ExtraBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w800,
      );
  static get labelMediumGray700 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.gray700,
  );
  static get labelMediumPoppinsBlack900 =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumWhiteA700 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.whiteA700,
  );
  static get labelSmallTeal700 => theme.textTheme.labelSmall!.copyWith(
    color: appTheme.teal700,
  );
  static get labelSmallWhiteA700 => theme.textTheme.labelSmall!.copyWith(
    color: appTheme.whiteA700,
    fontSize: 8.fSize,
  );
  // Title text style
  static get titleLarge20 => theme.textTheme.titleLarge!.copyWith(
    fontSize: 20.fSize,
  );
  static get titleLarge22 => theme.textTheme.titleLarge!.copyWith(
    fontSize: 22.fSize,
  );
  static get titleLargeMulishGray800 =>
      theme.textTheme.titleLarge!.mulish.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w800,
      );
  static get titleLargeMulishIndigo700 =>
      theme.textTheme.titleLarge!.mulish.copyWith(
        color: appTheme.indigo700,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleLargeMulishPrimary =>
      theme.textTheme.titleLarge!.mulish.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w800,
      );
  static get titleLargeMulishWhiteA700 =>
      theme.textTheme.titleLarge!.mulish.copyWith(
        color: appTheme.whiteA700,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.whiteA700,
  );
  static get titleMedium17 => theme.textTheme.titleMedium!.copyWith(
    fontSize: 17.fSize,
  );
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
    fontSize: 18.fSize,
  );
  static get titleMedium19 => theme.textTheme.titleMedium!.copyWith(
    fontSize: 19.fSize,
  );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w700,
  );
  static get titleMediumGray700 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray700,
  );
  static get titleMediumMulish => theme.textTheme.titleMedium!.mulish.copyWith(
    fontWeight: FontWeight.w800,
  );
  static get titleMediumMulishBluegray200 =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: appTheme.blueGray200,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumMulishBold =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumMulishGray700 =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: appTheme.gray700,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumMulishGray800 =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: appTheme.gray800,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumMulishPrimary =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumMulishWhiteA700 =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: appTheme.whiteA700,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumMulishff0961f5 =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: Color(0XFF0961F5),
        fontSize: 17.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumTeal700 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.teal700,
  );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.whiteA700,
    fontSize: 18.fSize,
  );
  static get titleSmall15 => theme.textTheme.titleSmall!.copyWith(
    fontSize: 15.fSize,
  );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black900,
  );
  static get titleSmallBlack900ExtraBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w800,
      );
  static get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray900.withOpacity(0.8),
  );
  static get titleSmallBluegray90015 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray900,
    fontSize: 15.fSize,
  );
  static get titleSmallBluegray900ExtraBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w800,
      );
  static get titleSmallBluegray900ExtraBold15 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleSmallBluegray900_1 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray900.withOpacity(0.8),
  );
  static get titleSmallBluegray900_2 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray900,
  );
  static get titleSmallExtraBold => theme.textTheme.titleSmall!.copyWith(
    fontSize: 15.fSize,
    fontWeight: FontWeight.w800,
  );
  static get titleSmallExtraBold_1 => theme.textTheme.titleSmall!.copyWith(
    fontWeight: FontWeight.w800,
  );
  static get titleSmallGray500 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray500,
    fontWeight: FontWeight.w600,
  );
  static get titleSmallGray50015 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray500,
    fontSize: 15.fSize,
  );
  static get titleSmallGray800 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray800,
  );
  static get titleSmallGray80001 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray80001,
    fontSize: 15.fSize,
  );
  static get titleSmallJostBluegray900 =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: appTheme.blueGray900,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallJostBluegray900SemiBold =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallJostWhiteA700 =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallJostWhiteA700SemiBold =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallJostff0961f5 =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: Color(0XFF0961F5),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallJostff202244 =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: Color(0XFF202244),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.primary,
    fontSize: 15.fSize,
    fontWeight: FontWeight.w800,
  );
  static get titleSmallPrimary15 => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.primary,
    fontSize: 15.fSize,
  );
  static get titleSmallPrimaryExtraBold => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w800,
  );
  static get titleSmallTeal700 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.teal700,
    fontWeight: FontWeight.w800,
  );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.whiteA700,
  );
  static get titleSmallWhiteA700ExtraBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleSmallWhiteA700ExtraBold_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w800,
      );
  static get titleSmallff0961f5 => theme.textTheme.titleSmall!.copyWith(
    color: Color(0XFF0961F5),
    fontWeight: FontWeight.w800,
  );
  static get titleSmallff545454 => theme.textTheme.titleSmall!.copyWith(
    color: Color(0XFF545454),
  );
}

extension on TextStyle {
  TextStyle get mulish {
    return copyWith(
      fontFamily: 'Mulish',
    );
  }

  TextStyle get aubrey {
    return copyWith(
      fontFamily: 'Aubrey',
    );
  }

  TextStyle get helenaJohnsmith {
    return copyWith(
      fontFamily: 'Helena Johnsmith',
    );
  }

  TextStyle get mishella {
    return copyWith(
      fontFamily: 'Mishella',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get jost {
    return copyWith(
      fontFamily: 'Jost',
    );
  }
}
