import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Common.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// ![](https://raw.githubusercontent.com/jaweii/Flutter_beautiful_popup/master/img/bg/rocket_blue.png)
class TemplateBlueRocket extends BeautifulPopupTemplate {
  final BeautifulPopup options;
  TemplateBlueRocket(this.options) : super(options);

  @override
  final illustrationPath = 'img/bg/rocket_blue.png';
  @override
  Color get primaryColor => options.primaryColor ?? Color(0xff4aa3f9);
  @override
  final maxWidth = 400;
  @override
  final maxHeight = 512;
  @override
  final bodyMargin = 0;

  @override
  Widget get title {
    if (options.title is Widget) {
      return SizedBox(
        width: percentW(54) as double?,
        height: percentH(10) as double?,
        child: options.title,
      );
    }
    return SizedBox(
      width: percentW(54) as double?,
      child: Opacity(
        opacity: 0.9,
        child: AutoSizeText(
          options.title,
          maxLines: 1,
          style: TextStyle(
            fontSize: Theme.of(options.context!).textTheme.display1!.fontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  get layout {
    return [
      Positioned(
        child: background,
      ),
      Positioned(
        top: percentH(13) as double?,
        left: percentW(10) as double?,
        child: title,
      ),
      Positioned(
        top: percentH(40) as double?,
        left: percentW(10) as double?,
        right: percentW(10) as double?,
        height: percentH(actions == null ? 50 : 38) as double?,
        child: content!,
      ),
      Positioned(
        bottom: percentW(12) as double?,
        left: percentW(10) as double?,
        right: percentW(10) as double?,
        child: actions ?? Container(),
      ),
    ];
  }
}
