const String imagesPatch = 'assets/images/';
const String iconsPatch = 'assets/icons/';
const String svgPatch = 'assets/svg/';
const String jsonPatch = 'assets/json/';

abstract class ImageAssets {
  static const String logo = '${imagesPatch}logo.png';
  static const String splash = '${imagesPatch}SplashScreen.png';

  // todo : ads image
  static const String adsImage1 = '${imagesPatch}adsimage.png';
  static const String adsImage2 = '${imagesPatch}adsimage2.png';
  static const String adsImage3 = '${imagesPatch}adsimage3.png';
}

abstract class IconAssets {
  static const String logo = '${iconsPatch}logo.png';
}

abstract class SvgAssets {
  static const String logo = '${svgPatch}logo.svg';
}