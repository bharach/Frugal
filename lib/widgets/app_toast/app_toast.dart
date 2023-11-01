
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';


   appToast({
    required BuildContext context,
    required String msg,
    required Color bgColor,
  }) {
    return showToast(
      'Erroor',
      context: context,
      backgroundColor: Colors.red,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.scale,
      position: StyledToastPosition.bottom,
      animDuration: const Duration(seconds: 1),
      curve: Curves.elasticOut,
      reverseCurve: Curves.elasticIn,
    );
  }