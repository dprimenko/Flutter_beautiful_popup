import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Common.dart';
import '../main.dart';

/// ![](https://raw.githubusercontent.com/jaweii/Flutter_beautiful_popup/master/img/bg/rocket_green.png)
class TemplateGreenRocket extends BeautifulPopupTemplate {
  final BeautifulPopup options;
  TemplateGreenRocket(this.options) : super(options);

  @override
  final illustrationPath = 'img/bg/rocket_green.png';
  @override
  Color get primaryColor => options.primaryColor ?? Color(0xff49ceae);
  @override
  final maxWidth = 400;
  @override
  final maxHeight = 496;
  @override
  final bodyMargin = 0;
  @override
  get layout {
    return [
      Positioned(
        child: background,
      ),
      Positioned(
        top: percentH(35) as double?,
        child: title,
      ),
      Positioned(
        top: percentH(45) as double?,
        left: percentW(14) as double?,
        right: percentW(14) as double?,
        height: percentH(actions == null ? 44 : 32) as double?,
        child: content!,
      ),
      Positioned(
        bottom: percentW(12) as double?,
        left: percentW(12) as double?,
        right: percentW(12) as double?,
        child: actions ?? Container(),
      ),
    ];
  }
}
