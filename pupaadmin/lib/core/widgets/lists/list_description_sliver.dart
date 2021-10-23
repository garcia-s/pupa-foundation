import 'package:flutter/material.dart';

class ListDescriptionSliver extends StatelessWidget {
  final String text;
  const ListDescriptionSliver(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Text(
          text,
          style: _theme.textTheme.button,
        ),
      ),
    );
  }
}
