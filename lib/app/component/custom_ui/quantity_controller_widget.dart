import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/themes/colors_palette.dart';
import '../../../common/themes/typography_theme.dart';

class QuantityControllerWidget extends StatelessWidget {
  final Function() onIncrement, onDecrement;
  final int quantity;
  const QuantityControllerWidget(
      {Key? key, required this.onIncrement, required this.onDecrement, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorsPalette.grey,
          borderRadius: BorderRadiusDirectional.circular(32),
          border: Border.all(color: Colors.black12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Center(
                  child: IconButton(
                      onPressed: onDecrement,
                      icon: const Icon(CupertinoIcons.minus)))),
          Expanded(
            flex: 2,
            child: Container(
              width: 85,
              height: double.infinity,
              color: Colors.white,
              child: Center(
                child: Text(
                  '$quantity',
                  style: TypographyTheme.titleLarge
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Center(
                  child: IconButton(
                      onPressed: onIncrement,
                      icon: const Icon(
                        CupertinoIcons.add,
                        size: 18,
                      ))))
        ],
      ),
    );
  }
}
