import 'package:barista/core/constant/app_colors.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {

  final Function()? onPressed;
  final String? btnText;
  final Color color;
  final Color txtColor;
  final bool shouldShowIcon;
  final IconData icon;

  AppFilledButton({
    this.onPressed,
    this.btnText,
    this.color = kcPrimaryColor,
    this.txtColor = kcWhiteColor,
    this.shouldShowIcon = false,
    this.icon = Icons.add,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: btnForeground(),
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(50)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: color)))));
  }

  Widget btnForeground() {
    if (shouldShowIcon) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          horizontalSpaceSmall,
          AppText.body(
            btnText,
            color: txtColor,
          ),
        ],
      );
    } else {
      return AppText.body(
        btnText,
        color: txtColor,
      );
    }
  }
}
