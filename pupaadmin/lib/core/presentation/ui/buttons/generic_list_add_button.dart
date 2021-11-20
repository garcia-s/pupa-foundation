import 'package:flutter/material.dart';

class GenericListAddButton extends StatelessWidget {
  final Function() onPressed;
  const GenericListAddButton(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
        child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(150, 40)),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Agregar'),
          Icon(
            Icons.add,
            color: scheme.onPrimary,
          ),
        ],
      ),
    ));
  }
}
