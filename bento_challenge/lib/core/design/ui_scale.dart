import 'package:flutter/cupertino.dart';

class UIScale {
  static late double _widthDevice;
  static late double _heightDevice;
  static late double _mediaQueryTopPadding;
  static late double _mediaQueryBottomPadding;
  static late double _pixelRatio;
  static const double generalAspectRatio = 2.25;

  static double width(double percentage) => (_widthDevice / 100) * percentage;
  static double height(double percentage) => (_heightDevice / 100) * percentage;
  static double centimetersToPixels(double cm) => cm * _pixelRatio * 38.0;
  static double pixelsToCentimeters(double px) => px / _pixelRatio / 38.0;

  static double get deviceTopPadding => _mediaQueryTopPadding;
  static double get bottomDevicePadding => _mediaQueryBottomPadding;
  static double get widthDevice => _widthDevice;
  static double get heightDevice => _heightDevice;
  static double get pixelRatio => _pixelRatio;

  static void init(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _widthDevice = screenSize.width;
    _heightDevice = screenSize.height;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _mediaQueryTopPadding = MediaQuery.of(context).padding.top;
    _mediaQueryBottomPadding = MediaQuery.of(context).padding.bottom;
    debugPrint("DEVICE HEIGHT: $_heightDevice");
    debugPrint("DEVICE WIDTH: $_widthDevice");
    debugPrint("DEVICE TOP PADDING: $_mediaQueryTopPadding");
  }

  static void forceInit(BuildContext context) async {
    Size screenSize = MediaQuery.of(context).size;
    if (screenSize.width <= 0) {
      forceInit(context);
    } else {
      debugPrint(screenSize.toString());
      init(context);
      return;
    }
  }
}
