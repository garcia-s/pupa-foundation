import 'package:flutter/material.dart';
import 'package:pupaadmin/widgets/buttons/rounded_elevated_button.dart';
import 'package:pupaadmin/widgets/lists/generic_editable_list_sliver.dart';
import 'package:pupaadmin/widgets/lists/pressable_generic_list_item.dart';

class MultiSelectDialogOption<T> {
  MultiSelectDialogOption({
    required this.name,
    required this.value,
  });

  final String name;
  final T value;
}

class MultiSelectDialog<T> extends StatefulWidget {
  final void Function(List<T> value) onConfirm;
  final List<MultiSelectDialogOption> options;
  final List<T>? initialValue;
  const MultiSelectDialog({
    Key? key,
    this.initialValue,
    required this.options,
    required this.onConfirm,
  }) : super(key: key);

  @override
  State<MultiSelectDialog<T>> createState() =>
      //Ignore this stupid lint please
      _MultiSelectDialogState<T>(initialValue);
}

class _MultiSelectDialogState<T> extends State<MultiSelectDialog<T>> {
  _MultiSelectDialogState(List<T>? initialValue) : list = initialValue ?? [];
  List<T> list = [];

  void toggleValue(T value) => setState(() => list = list.contains(value)
      ? List.unmodifiable(list.where((e) => e != value))
      : List.unmodifiable([...list, value]));
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(children: [
        Container(
          width: size.width > 900 ? size.width * 0.7 : size.width * 0.9,
          height: size.height * 0.9,
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 60),
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomScrollView(
            slivers: [
              GenericEditableListSliver<MultiSelectDialogOption>(
                list: widget.options,
                render: (selectOption, i) => PressableGenericListItem(
                    onPressed: () => toggleValue(selectOption.value),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Checkbox(
                            focusNode: FocusNode(skipTraversal: true),
                            onChanged: (_) => toggleValue(selectOption.value),
                            value: list.contains(selectOption.value),
                          ),
                          Expanded(
                            child: Text(selectOption.name),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedElevatedButton(
                  child: const Text('Aceptar'),
                  onPressed: () {
                    widget.onConfirm(list);
                    Navigator.of(context).pop();
                  },
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 20),
                RoundedElevatedButton(
                  child: const Text('Cancelar'),
                  onPressed: () => Navigator.of(context).pop(),
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
