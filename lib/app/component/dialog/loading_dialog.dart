import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import '../../../common/themes/colors_palette.dart';

void showLoadingDialog({required BuildContext context, String? loadingText}) {
  CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
      lottieAsset: 'assets/lottie/loading_animation.json',
      text: loadingText ?? 'Loading..',
      barrierDismissible: false);
}

void showWarningDialog(
    {required BuildContext context,
      required String title,
      required String message,
      VoidCallback? onTap}) {
  CoolAlert.show(
      context: context,
      confirmBtnColor: ColorsPalette.greenColor,
      type: CoolAlertType.warning,
      title: title,
      text: message,
      loopAnimation: false,
      barrierDismissible: false,
      onConfirmBtnTap: onTap);
}