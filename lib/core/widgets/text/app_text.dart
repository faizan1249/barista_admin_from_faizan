import 'package:barista/core/constant/app_colors.dart';
import 'package:barista/core/widgets/utils/styles.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? text;
  final TextStyle style;
  final TextAlign alignment;

  AppText.headingOne(this.text,
      {Color color = kcBlackColor, TextAlign align = TextAlign.start})
      : style = heading1Style.copyWith(color: color),
        alignment = align;

  AppText.headingTwo(this.text,
      {Color color = kcBlackColor, TextAlign align = TextAlign.start})
      : style = heading2Style.copyWith(color: color),
        alignment = align;

  AppText.headingThree(this.text,
      {Color color = kcBlackColor, TextAlign align = TextAlign.start})
      : style = heading3Style.copyWith(color: color),
        alignment = align;

  const AppText.headline(this.text, {TextAlign align = TextAlign.start})
      : style = headlineStyle,
        alignment = align;

  AppText.subheading(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start})
      : style = subheadingStyle.copyWith(color: color),
        alignment = align;

  AppText.caption(this.text,
      {Color color = kcBlackColor, TextAlign align = TextAlign.start})
      : style = captionStyle.copyWith(color: color),
        alignment = align;

  AppText.body(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start})
      : style = bodyStyle.copyWith(color: color),
        alignment = align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: style,
      textAlign: alignment,
    );
  }
}
