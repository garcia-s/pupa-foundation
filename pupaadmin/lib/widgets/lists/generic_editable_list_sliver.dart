import 'package:flutter/material.dart';

class GenericEditableListSliver<T> extends StatelessWidget {
  final List<T> list;
  final Widget? leading;
  final Widget? trailing;
  final Widget Function(T, int) render;

  const GenericEditableListSliver({
    this.leading,
    this.trailing,
    required this.render,
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        _LeadingWrapper(child: leading),
        ..._generateList(),
        _TrailingWrapper(child: trailing),
      ]),
    );
  }

  List<_GenericItemOutter> _generateList() {
    var index = 0;
    List<_GenericItemOutter> generated = [];
    for (T item in list) {
      generated.add(_GenericItemOutter(child: render(item, index)));
      index++;
    }
    return generated;
  }
}

class _LeadingWrapper extends StatelessWidget {
  const _LeadingWrapper({this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

class _TrailingWrapper extends StatelessWidget {
  final Widget? child;

  const _TrailingWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Center(
        child: child,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }
}

class _GenericItemOutter extends StatelessWidget {
  final Widget child;
  const _GenericItemOutter({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = Theme.of(context).colorScheme.background;
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: _color,
        border: Border.all(color: _color, width: 6),
      ),
    );
  }
}


