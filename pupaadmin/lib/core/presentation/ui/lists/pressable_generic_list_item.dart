import 'package:flutter/material.dart';

class PressableGenericListItem extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  const PressableGenericListItem({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = Theme.of(context).colorScheme.surface;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 0,
      ),
      child: RawMaterialButton(
        child: child,
        onPressed: onPressed,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        fillColor: _color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
