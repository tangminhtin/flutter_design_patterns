import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformButton extends StatelessWidget {
  final Widget child;
  final Color materialColor;
  final Color materialTextColor;
  final VoidCallback onPressed;

  const PlatformButton({
    super.key,
    required this.child,
    required this.materialColor,
    required this.materialTextColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? MaterialButton(
            onPressed: onPressed,
            color: materialColor,
            textColor: materialTextColor,
            child: child,
          )
        : CupertinoButton.filled(
            onPressed: onPressed,
            child: child,
          );
  }
}
