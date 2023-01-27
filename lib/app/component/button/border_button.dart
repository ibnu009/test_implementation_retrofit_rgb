import 'package:flutter/material.dart';
import '../../../common/themes/colors_palette.dart';

class BorderButton extends StatelessWidget {
  final BuildContext context;
  final bool isEnabled;
  final Function() onPressed;
  final Function()? onNotActivePressed;

  final String text;
  final Color? color;
  final double? width, height, leftPadding, rightPadding, radius, horizontalMargin;

  const BorderButton(
      {Key? key,
      required this.context,
      required this.isEnabled,
      required this.onPressed,
      required this.text,
      this.color,
      this.width,
      this.height,
      this.leftPadding,
      this.rightPadding, this.radius, this.horizontalMargin, this.onNotActivePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onPressed : onNotActivePressed ?? (){},
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadiusDirectional.circular(radius ?? 32),
            border: Border.all(color: isEnabled ? color ?? ColorsPalette.greenColor : Colors.black38)),
        padding:
            EdgeInsets.fromLTRB(leftPadding ?? 4, 0, rightPadding ?? 4, 0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15, color: isEnabled ? color ?? ColorsPalette.greenColor : Colors.black38),
          ),
        ),
      ),
    );
  }
}
