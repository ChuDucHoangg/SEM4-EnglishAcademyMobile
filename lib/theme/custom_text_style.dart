import 'package:flutter/material.dart';
import 'package:english_academy_mobile/core/utils/size_utils.dart';
import 'package:english_academy_mobile/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
    color: theme.colorScheme.primary,
  );
  static get bodyLargeBluegray100 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.blueGray100,
  );
  static get bodyLargeBluegray300 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.blueGray300,
  );
  static get bodyLargeBluegray30002 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.blueGray30002,
  );
  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.gray600,
  );
  static get bodyLargeGray60001 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.gray60001,
  );
  static get bodyLargeff111827 => theme.textTheme.bodyLarge!.copyWith(
    color: Color(0XFF111827),
  );
  static get bodyLargeff6b7280 => theme.textTheme.bodyLarge!.copyWith(
    color: Color(0XFF6B7280),
  );
  static get bodyLargeff97a9bd => theme.textTheme.bodyLarge!.copyWith(
    color: Color(0XFF97A9BD),
  );
  static get bodyMediumBluegray100 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.blueGray100,
  );
  static get bodyMediumBluegray300 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.blueGray300,
  );
  static get bodyMediumBluegray30002 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.blueGray30002,
  );
  static get bodyMediumGray60001 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray60001,
  );
  // static get bodyMediumManropeGray60001 =>
  //     theme.textTheme.bodyMedium!.manrope.copyWith(
  //       color: appTheme.gray60001,
  //     );
  static get bodyMediumOnErrorContainer => theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.onErrorContainer.withOpacity(0.5),
  );
  static get bodyMediumOnErrorContainer_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  // static get bodyMediumPlusJakartaSans =>
  //     theme.textTheme.bodyMedium!.plusJakartaSans;
  static get bodyMediumff111827 => theme.textTheme.bodyMedium!.copyWith(
    color: Color(0XFF111827),
  );
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
    fontSize: 10.fSize,
  );
  static get bodySmallBluegray300 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.blueGray300,
    fontSize: 10.fSize,
  );
  static get bodySmallBluegray30002 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.blueGray30002,
  );
  static get bodySmallBluegray300_1 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.blueGray300,
  );
  static get bodySmallBluegray50002 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.blueGray50002,
  );
  static get bodySmallBluegray700 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.blueGray700,
  );
  static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray900,
  );
  // static get bodySmallSatoshiff6b7280 =>
  //     theme.textTheme.bodySmall!.satoshi.copyWith(
  //       color: Color(0XFF6B7280),
  //     );
  static get bodySmallff6b7280 => theme.textTheme.bodySmall!.copyWith(
    color: Color(0XFF6B7280),
  );
  // Headline text style
  static get headlineMediumBluegray80001 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.blueGray80001,
      );
  static get headlineMediumOnErrorContainer =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get headlineSmallBluegray80001 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blueGray80001,
      );
  static get headlineSmallGray90001 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.gray90001,
  );
  static get headlineSmallOnErrorContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  // Label text style
  static get labelLargeBlueA200 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueA200,
  );
  static get labelLargeBlueA700 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueA700,
  );
  static get labelLargeBlueA700Medium => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueA700,
    fontWeight: FontWeight.w500,
  );
  static get labelLargeBluegray300 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueGray300,
    fontWeight: FontWeight.w500,
  );
  static get labelLargeBluegray300_1 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueGray300,
  );
  static get labelLargeBluegray500 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueGray500,
  );
  static get labelLargeBluegray80001 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.blueGray80001,
  );
  static get labelLargeGray60001 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray60001,
    fontWeight: FontWeight.w500,
  );
  static get labelLargeGray60001_1 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray60001,
  );
  static get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray900,
    fontWeight: FontWeight.w500,
  );
  static get labelLargeGray900_1 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray900,
  );
  static get labelLargeGreenA400 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.greenA400,
    fontWeight: FontWeight.w500,
  );
  // static get labelLargeManropeRedA200 =>
  //     theme.textTheme.labelLarge!.manrope.copyWith(
  //       color: appTheme.redA200,
  //       fontWeight: FontWeight.w600,
  //     );
  static get labelLargeMedium => theme.textTheme.labelLarge!.copyWith(
    fontWeight: FontWeight.w500,
  );
  static get labelLargeOnErrorContainer => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
  );
  static get labelLargeOnErrorContainerMedium =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  // static get labelLargePlusJakartaSansOnErrorContainer =>
  //     theme.textTheme.labelLarge!.plusJakartaSans.copyWith(
  //       color: theme.colorScheme.onErrorContainer.withOpacity(1),
  //       fontWeight: FontWeight.w600,
  //     );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w500,
  );
  static get labelLargePrimary_1 => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.primary,
  );
  static get labelLargeRedA200 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.redA200,
    fontWeight: FontWeight.w500,
  );
  static get labelLargeRedA200_1 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.redA200,
  );
  // static get labelLargeSFProDisplayBluegray300 =>
  //     theme.textTheme.labelLarge!.sFProDisplay.copyWith(
  //       color: appTheme.blueGray300,
  //       fontWeight: FontWeight.w500,
  //     );
  static get labelMediumAmberA200 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.amberA200,
    fontWeight: FontWeight.w700,
  );
  static get labelMediumBlueA700 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.blueA700,
    fontWeight: FontWeight.w700,
  );
  static get labelMediumBluegray300 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.blueGray300,
    fontWeight: FontWeight.w700,
  );
  static get labelMediumBluegray80001 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.blueGray80001,
  );
  static get labelMediumBold => theme.textTheme.labelMedium!.copyWith(
    fontWeight: FontWeight.w700,
  );
  static get labelMediumGray900 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.gray900,
  );
  static get labelMediumGreenA400 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.greenA400,
    fontWeight: FontWeight.w700,
  );
  // static get labelMediumManropeOnErrorContainer =>
  //     theme.textTheme.labelMedium!.manrope.copyWith(
  //       color: theme.colorScheme.onErrorContainer.withOpacity(1),
  //       fontWeight: FontWeight.w600,
  //     );
  static get labelMediumOnErrorContainer =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get labelMediumOnErrorContainer11 =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontSize: 11.fSize,
      );
  // static get labelMediumPlusJakartaSansOnErrorContainer =>
  //     theme.textTheme.labelMedium!.plusJakartaSans.copyWith(
  //       color: theme.colorScheme.onErrorContainer.withOpacity(1),
  //       fontWeight: FontWeight.w700,
  //     );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w700,
  );
  static get labelMediumRedA200 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.redA200,
    fontWeight: FontWeight.w700,
  );
  static get labelSmallAmberA200 => theme.textTheme.labelSmall!.copyWith(
    color: appTheme.amberA200,
  );
  static get labelSmallGray100 => theme.textTheme.labelSmall!.copyWith(
    color: appTheme.gray100,
    fontWeight: FontWeight.w500,
  );
  static get labelSmallGray900 => theme.textTheme.labelSmall!.copyWith(
    color: appTheme.gray900,
  );
  static get labelSmallOnErrorContainer => theme.textTheme.labelSmall!.copyWith(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
  );
  static get labelSmallOnErrorContainerMedium =>
      theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(0.6),
        fontWeight: FontWeight.w500,
      );
  static get labelSmallPrimary => theme.textTheme.labelSmall!.copyWith(
    color: theme.colorScheme.primary,
  );
  static get labelSmallRedA200 => theme.textTheme.labelSmall!.copyWith(
    color: appTheme.redA200,
  );
  // Title text style
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
    fontSize: 18.fSize,
  );
  static get titleMediumAmberA200 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.amberA200,
  );
  static get titleMediumBlueA700 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.blueA700,
  );
  static get titleMediumBluegray800 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.blueGray800,
  );
  static get titleMediumBluegray80001 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.blueGray80001,
  );
  static get titleMediumGray60001 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray60001,
  );
  static get titleMediumGreenA400 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.greenA400,
  );
  static get titleMediumIndigo100 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.indigo100,
  );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w500,
  );
  static get titleMediumOnErrorContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontSize: 18.fSize,
      );
  static get titleMediumOnErrorContainer_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.primary,
  );
  static get titleMediumPrimaryMedium => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w500,
  );
  // static get titleMediumUrbanistOnPrimaryContainer =>
  //     theme.textTheme.titleMedium!.urbanist.copyWith(
  //       color: theme.colorScheme.onPrimaryContainer,
  //     );
  static get titleMediumff111827 => theme.textTheme.titleMedium!.copyWith(
    color: Color(0XFF111827),
    fontWeight: FontWeight.w500,
  );
  static get titleMediumff1d2857 => theme.textTheme.titleMedium!.copyWith(
    color: Color(0XFF1D2857),
    fontWeight: FontWeight.w500,
  );
  static get titleMediumff1d2857_1 => theme.textTheme.titleMedium!.copyWith(
    color: Color(0XFF1D2857),
  );
  static get titleSmallBlueA700 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueA700,
  );
  static get titleSmallBluegray300 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray300,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallBluegray700 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray700,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallBluegray800 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray800,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallBluegray80001 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blueGray80001,
  );
  static get titleSmallGray600 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray600,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallGray60001 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray60001,
  );
  static get titleSmallGray60001Medium => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray60001,
    fontWeight: FontWeight.w500,
  );
  // static get titleSmallManropeBluegray80001 =>
  //     theme.textTheme.titleSmall!.manrope.copyWith(
  //       color: appTheme.blueGray80001,
  //     );
  // static get titleSmallManropeGray60001 =>
  //     theme.textTheme.titleSmall!.manrope.copyWith(
  //       color: appTheme.gray60001,
  //     );
  // static get titleSmallManropeOnErrorContainer =>
  //     theme.textTheme.titleSmall!.manrope.copyWith(
  //       color: theme.colorScheme.onErrorContainer.withOpacity(1),
  //     );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
    fontWeight: FontWeight.w500,
  );
  static get titleSmallOnErrorContainer => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.onErrorContainer.withOpacity(1),
    fontWeight: FontWeight.w500,
  );
  static get titleSmallOnErrorContainer_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  // static get titleSmallPlusJakartaSans =>
  //     theme.textTheme.titleSmall!.plusJakartaSans.copyWith(
  //       fontWeight: FontWeight.w500,
  //     );
  // static get titleSmallPlusJakartaSans_1 =>
  //     theme.textTheme.titleSmall!.plusJakartaSans;
  // static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
  //   color: theme.colorScheme.primary,
  // );
  static get titleSmallPrimaryMedium => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallff111827 => theme.textTheme.titleSmall!.copyWith(
    color: Color(0XFF111827),
  );
  static get titleSmallff111827Medium => theme.textTheme.titleSmall!.copyWith(
    color: Color(0XFF111827),
    fontWeight: FontWeight.w500,
  );
  static get titleSmallff1d2857 => theme.textTheme.titleSmall!.copyWith(
    color: Color(0XFF1D2857),
  );
  static get titleSmallff6b7280 => theme.textTheme.titleSmall!.copyWith(
    color: Color(0XFF6B7280),
    fontWeight: FontWeight.w500,
  );
  static get titleENT => theme.textTheme.titleSmall!.copyWith(
    color: Color(0XFF1D2857),
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 0
  );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'SFProText',
    );
  }

  // TextStyle get plusJakartaSans {
  //   return copyWith(
  //     fontFamily: 'Plus Jakarta Sans',
  //   );
  // }
  //
  // TextStyle get satoshi {
  //   return copyWith(
  //     fontFamily: 'Satoshi',
  //   );
  // }
  //
  // TextStyle get manrope {
  //   return copyWith(
  //     fontFamily: 'Manrope',
  //   );
  // }
  //
  // TextStyle get sFProDisplay {
  //   return copyWith(
  //     fontFamily: 'SF Pro Display',
  //   );
  // }
  //
  // TextStyle get urbanist {
  //   return copyWith(
  //     fontFamily: 'Urbanist',
  //   );
  // }
}
