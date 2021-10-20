import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  final double size;

  const CircularIconButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(size * 0.1),
      height: size,
      width: size,
      child: RawMaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(size / 2),
          ),
        ),
        fillColor: Theme.of(context).colorScheme.secondary,
        onPressed: onPressed,
        child: Icon(
          icon,
          size: size * 0.6,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
