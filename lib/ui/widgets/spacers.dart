import 'package:flutter/material.dart';

SizedBox spacer(
    {double height = 16.0, double width = 10.0, bool forInput = false}) {
  return SizedBox(
    height: forInput ? 10.0 : height,
    width: width,
  );
}

SizedBox bottomSpacer({double height = 20.0, bool forBannerAd = false}) {
  return SizedBox(
    height: forBannerAd ? 50.0 : height,
  );
}

SizedBox bottomTabsSpacer({double height = 60.0}) {
  return SizedBox(
    height: height,
  );
}
