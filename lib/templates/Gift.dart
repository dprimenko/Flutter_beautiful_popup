import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Common.dart';
import '../main.dart';

/// ![](https://raw.githubusercontent.com/jaweii/Flutter_beautiful_popup/master/img/bg/gift.png)
class TemplateGift extends BeautifulPopupTemplate {
  final BeautifulPopup options;
  TemplateGift(this.options) : super(options);

  @override
  final illustrationPath = 'img/bg/gift.png';
  @override
  Color get primaryColor => options.primaryColor ?? Color(0xffFF2F49);
  @override
  final maxWidth = 400;
  @override
  final maxHeight = 580;
  @override
  final bodyMargin = 30;
  @override
  BeautifulPopupButton get button {
    return ({
      required String label,
      required void Function() onPressed,
      bool? outline = false,
      bool? flat = false,
      TextStyle? labelStyle = const TextStyle(),
    }) {
      final gradient = LinearGradient(colors: [
        primaryColor.withOpacity(0.5),
        primaryColor,
      ]);
      final double elevation = (outline! || flat!) ? 0 : 2;
      final labelColor =
          (outline || flat!) ? primaryColor : Colors.white.withOpacity(0.95);
      final decoration = BoxDecoration(
        gradient: (outline || flat!) ? null : gradient,
        borderRadius: BorderRadius.all(Radius.circular(80.0)),
        border: Border.all(
          color: outline ? primaryColor : Colors.transparent,
          width: (outline && !flat!) ? 1 : 0,
        ),
      );
      final minHeight = 40.0 - (outline ? 4 : 0);
      return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            elevation: MaterialStateProperty.all<double?>(elevation),
            padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ))
        ),
        child: Ink(
          decoration: decoration,
          child: Container(
            constraints: BoxConstraints(
              minWidth: 100,
              minHeight: minHeight,
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.95),
                fontWeight: FontWeight.bold,
              ).merge(labelStyle),
            ),
          ),
        ),
        onPressed: onPressed,
      );
    };
  }

  @override
  get layout {
    return [
      Positioned(
        child: background,
      ),
      Positioned(
        top: percentH(26) as double?,
        child: title,
      ),
      Positioned(
        top: percentH(36) as double?,
        left: percentW(5) as double?,
        right: percentW(5) as double?,
        height: percentH(actions == null ? 60 : 50) as double?,
        child: content!,
      ),
      Positioned(
        bottom: percentW(5) as double?,
        left: percentW(5) as double?,
        right: percentW(5) as double?,
        child: actions ?? Container(),
      ),
    ];
  }
}
