import 'package:flutter/material.dart';

class AppTextstyles {
  AppTextstyles._();

  // Base text styles with different font families
  static const TextStyle _baseRegular = TextStyle(
    fontFamily: 'Poppins-Regular',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _baseLight = TextStyle(
    fontFamily: 'Poppins-Light',
    fontWeight: FontWeight.w300,
  );

  static const TextStyle _baseSemiBold = TextStyle(
    fontFamily: 'Poppins-SemiBold',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _baseBold = TextStyle(
    fontFamily: 'Poppins-Bold',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle _baseMedium = TextStyle(
    fontFamily: 'Poppins-Medium',
    fontWeight: FontWeight.w500,
  );

  //create base text styles for the figtree font family
  static const TextStyle _baseRegularFigtree = TextStyle(
    fontFamily: 'Figtree-Regular',
    fontWeight: FontWeight.w400,
  );
  static const TextStyle _baseLightFigtree = TextStyle(
    fontFamily: 'Figtree-Light',
    fontWeight: FontWeight.w300,
  );
  static const TextStyle _baseSemiBoldFigtree = TextStyle(
    fontFamily: 'Figtree-SemiBold',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle _baseBoldFigtree = TextStyle(
    fontFamily: 'Figtree-Bold',
    fontWeight: FontWeight.w700,
  );
  // Figtree text styles
  static TextStyle regularFigtree({double size = 14, Color? color}) =>
      _baseRegularFigtree.copyWith(fontSize: size, color: color);
  static TextStyle lightFigtree({double size = 14, Color? color}) =>
      _baseLightFigtree.copyWith(fontSize: size, color: color);
  static TextStyle semiBoldFigtree({double size = 14, Color? color}) =>
      _baseSemiBoldFigtree.copyWith(fontSize: size, color: color);
  static TextStyle boldFigtree({double size = 14, Color? color}) =>
      _baseBoldFigtree.copyWith(fontSize: size, color: color);

  // Regular text styles
  static TextStyle regular({double size = 14, Color? color}) =>
      _baseRegular.copyWith(fontSize: size, color: color);

  static TextStyle light({double size = 14, Color? color}) =>
      _baseLight.copyWith(fontSize: size, color: color);

  static TextStyle semiBold({double size = 14, Color? color}) =>
      _baseSemiBold.copyWith(fontSize: size, color: color);

  static TextStyle bold({double size = 14, Color? color}) =>
      _baseBold.copyWith(fontSize: size, color: color);

  static TextStyle mainMedium({double size = 14, Color? color}) =>
      _baseMedium.copyWith(fontSize: size, color: color);

  // Common predefined sizes
  static TextStyle get small => regular(size: 12);
  static TextStyle get medium => regular(size: 14);
  static TextStyle get large => regular(size: 16);
  static TextStyle get xlarge => regular(size: 18);

  static TextStyle get smallLight => light(size: 12);
  static TextStyle get mediumLight => light(size: 14);
  static TextStyle get largeLight => light(size: 16);

  static TextStyle get smallSemiBold => semiBold(size: 12);
  static TextStyle get mediumSemiBold => semiBold(size: 14);
  static TextStyle get largeSemiBold => semiBold(size: 16);

  static TextStyle get smallBold => bold(size: 12);
  static TextStyle get mediumBold => bold(size: 14);
  static TextStyle get largeBold => bold(size: 16);

  // Heading styles
  static TextStyle get heading1 => bold(size: 24);
  static TextStyle get heading2 => bold(size: 20);
  static TextStyle get heading3 => semiBold(size: 18);
}
