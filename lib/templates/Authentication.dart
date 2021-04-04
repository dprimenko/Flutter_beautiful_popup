import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../main.dart';
import 'Common.dart';

/// ![](https://raw.githubusercontent.com/jaweii/Flutter_beautiful_popup/master/img/bg/authentication.png)
class TemplateAuthentication extends BeautifulPopupTemplate {
  final BeautifulPopup options;
  TemplateAuthentication(this.options) : super(options);

  @override
  final illustrationPath = 'img/bg/authentication.png';
  @override
  Color get primaryColor => options.primaryColor ?? Color(0xff15c0ec);
  @override
  final maxWidth = 400;
  @override
  final maxHeight = 617;
  @override
  final bodyMargin = 0;
  @override
  get layout {
    return [
      Positioned(
        child: background,
      ),
      Positioned(
        top: percentH(32) as double?,
        child: title,
      ),
      Positioned(
        top: percentH(44) as double?,
        left: percentW(10) as double?,
        right: percentW(10) as double?,
        height: percentH(actions == null ? 52 : 38) as double?,
        child: content!,
      ),
      Positioned(
        bottom: percentW(8) as double?,
        left: percentW(8) as double?,
        right: percentW(8) as double?,
        child: actions ?? Container(),
      ),
    ];
  }
}
