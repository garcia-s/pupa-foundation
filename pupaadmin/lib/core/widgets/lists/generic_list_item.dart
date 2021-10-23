import 'package:flutter/material.dart';

class GenericListItem extends StatelessWidget {
  final Widget child;
  const GenericListItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    return Container(
      child: child,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: _colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 0,
      ),
    );
  }
}
