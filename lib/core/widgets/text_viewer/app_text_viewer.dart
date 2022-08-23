import 'package:barista/core/constant/app_colors.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:flutter/cupertino.dart';

class AppTextViewer extends StatelessWidget {

  final String? title;
  final String? value;

  AppTextViewer({
    this.title,
    this.value,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.subheading(title),
        verticalSpaceTiny,
        RowExpanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: kcLightGreyColor),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: AppText.subheading(value),
          ),
        ),
      ],
    );
  }
}
