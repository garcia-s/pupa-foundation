import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final Color color;
  final Widget child;
  const RoundedElevatedButton({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          )),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: child,
      );
}
