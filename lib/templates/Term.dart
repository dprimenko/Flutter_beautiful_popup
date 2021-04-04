import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../main.dart';
import 'Common.dart';

/// ![](https://raw.githubusercontent.com/jaweii/Flutter_beautiful_popup/master/img/bg/term.png)
class TemplateTerm extends BeautifulPopupTemplate {
  final BeautifulPopup options;
  TemplateTerm(this.options) : super(options);

  @override
  final illustrationPath = 'img/bg/term.png';
  @override
  Color get primaryColor => options.primaryColor ?? Color(0xfffb8c3c);
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
        top: percentH(42) as double?,
        left: percentW(12) as double?,
        right: percentW(12) as double?,
        height: percentH(actions == null ? 52 : 42) as double?,
        child: content!,
      ),
      Positioned(
        bottom: percentW(9) as double?,
        left: percentW(12) as double?,
        right: percentW(12) as double?,
        child: actions ?? Container(),
      ),
    ];
  }
}
