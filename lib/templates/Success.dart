import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Common.dart';
import '../main.dart';

/// ![](https://raw.githubusercontent.com/jaweii/Flutter_beautiful_popup/master/img/bg/success.png)
class TemplateSuccess extends BeautifulPopupTemplate {
  final BeautifulPopup options;
  TemplateSuccess(this.options) : super(options);

  @override
  final illustrationPath = 'img/bg/success.png';
  @override
  Color get primaryColor => options.primaryColor ?? Color(0xff4ABDFE);
  @override
  final maxWidth = 400;
  @override
  final maxHeight = 588;
  @override
  final bodyMargin = 30;
  @override
  get layout {
    return [
      Positioned(
        child: background,
      ),
      Positioned(
        top: percentH(46) as double?,
        child: title,
      ),
      Positioned(
        top: percentH(58) as double?,
        left: percentW(8) as double?,
        right: percentW(8) as double?,
        height: percentH(actions == null ? 40 : 24) as double?,
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
