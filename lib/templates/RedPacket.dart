import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'Common.dart';

/// ![](https://raw.githubusercontent.com/jaweii/Flutter_beautiful_popup/master/img/bg/red_packet.png)
class TemplateRedPacket extends BeautifulPopupTemplate {
  final BeautifulPopup options;
  TemplateRedPacket(this.options) : super(options);

  @override
  final illustrationPath = 'img/bg/red_packet.png';
  @override
  Color get primaryColor => options.primaryColor ?? Color(0xfffa1a2c);
  @override
  final maxWidth = 400;
  @override
  final maxHeight = 620;
  @override
  final bodyMargin = 0;
  @override
  Widget get title {
    if (options.title is Widget) {
      return SizedBox(
        width: percentW(100) as double?,
        height: percentH(10) as double?,
        child: Center(
          child: options.title,
        ),
      );
    }
    return SizedBox(
      width: percentW(100) as double?,
      child: Center(
        child: Opacity(
          opacity: 0.95,
          child: AutoSizeText(
            options.title,
            maxLines: 1,
            style: TextStyle(
              fontSize: Theme.of(options.context!).textTheme.headline4!.fontSize,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget? get content {
    return options.content is String
        ? AutoSizeText(
            options.content,
            minFontSize: Theme.of(options.context!).textTheme.subtitle1!.fontSize!,
            style: TextStyle(
              color: Colors.white.withOpacity(0.95),
            ),
          )
        : options.content;
  }

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
      final minHeight = 40.0 - (outline ? 2 : 0);
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
        top: percentH(10) as double?,
        child: title,
      ),
      Positioned(
        top: percentH(40) as double?,
        left: percentW(12) as double?,
        right: percentW(12) as double?,
        height: percentH(actions == null ? 56 : 42) as double?,
        child: content!,
      ),
      Positioned(
        bottom: percentW(10) as double?,
        left: percentW(10) as double?,
        right: percentW(10) as double?,
        child: actions ?? Container(),
      ),
    ];
  }
}
