import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pupaadmin/widgets/lists/generic_editable_list_sliver.dart';

class GenericSearchableEditableList<T> extends StatefulWidget {
  const GenericSearchableEditableList({
    Key? key,
    this.leading,
    this.trailing,
    required this.list,
    required this.render,
    required this.search,
  }) : super(key: key);

  final List<T> list;
  final Widget Function(T, int) render;
  final Widget? leading;
  final Widget? trailing;
  final bool Function(T, String s) search;

  @override
  _GenericListState<T> createState() => _GenericListState<T>();
}

class _GenericListState<T> extends State<GenericSearchableEditableList<T>> {
  String? _searchQuery;
  _GenericListState();

  @override
  Widget build(BuildContext context) {
    var _list = _searchQuery != null
        ? (widget.list).where((t) => widget.search(t, _searchQuery!)).toList()
        : widget.list;
    return Scrollbar(
      isAlwaysShown: true,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    autofocus: false,
                    onChanged: (txt) => setState(
                      () => _searchQuery = txt,
                    ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search), isDense: true),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: GenericEditableListSliver<T>(
              render: widget.render,
              leading: widget.leading,
              trailing: widget.trailing,
              list: _list,
            ),
          )
        ],
      ),
    );
  }
}
