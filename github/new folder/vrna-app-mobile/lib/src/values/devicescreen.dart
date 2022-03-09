import 'package:flutter/material.dart';

enum DeviceScreenType { Mobile, Tablet, Desktop, Tv }
DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;
  double deviceWidth = 0;
  // if (orientation == Orientation.landscape) {
  //   deviceWidth = mediaQuery.size.height;
  // } else {
  //   deviceWidth = mediaQuery.size.width;
  // }
  deviceWidth = mediaQuery.size.width;
  //if (deviceWidth >= 1501) {
  if (deviceWidth >= 1351) {
    return DeviceScreenType.Tv;
  }
  if ((deviceWidth >= 1024) && (deviceWidth <= 1350)) {
    return DeviceScreenType.Desktop;
  }
  if ((deviceWidth > 600) && (deviceWidth < 1023)) {
    return DeviceScreenType.Tablet;
  }
  return DeviceScreenType.Mobile;
}
