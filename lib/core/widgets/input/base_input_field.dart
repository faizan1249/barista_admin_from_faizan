import 'package:flutter/material.dart';

class BaseInputField extends StatelessWidget {
  final String? title;
  final Widget inputControl;
  final bool displayTitleArea;
  final bool displayOptionalText;

  const BaseInputField(
      {Key? key,
      required this.title,
      required this.inputControl,
      this.displayTitleArea = false,
      this.displayOptionalText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleText(),
            _buildOptionalTag(),
          ],
        ),
        // _buildTitleText(),
        inputControl,
      ],
    );
  }

  Widget _buildOptionalTag() {
    if (displayOptionalText) {
      return Text(
        '(optional)',
        style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5)),
      );
    }
    return Container();
  }

  Widget _buildTitleText() {
    if (title != '' || displayTitleArea) {
      return Column(children: [
        Text(
          title ?? '',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 8,
        ),
      ]);
    }

    return Container();
  }
}
