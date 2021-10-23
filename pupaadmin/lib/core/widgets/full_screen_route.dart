import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullScreenRoute extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  const FullScreenRoute({
    Key? key,
    required this.child,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (evt) =>
          (evt is RawKeyDownEvent) && evt.logicalKey.keyLabel == 'Escape'
              ? Navigator.of(context).pop()
              : null,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(),
        body: child,
      ),
    );
  }
}
