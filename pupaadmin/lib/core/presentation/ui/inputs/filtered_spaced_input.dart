import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilteredSpacedInput<T> extends StatelessWidget {
  final String? labelText;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry padding;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final int? maxLength;

  const FilteredSpacedInput({
    Key? key,
    this.labelText,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLength,
    required this.padding,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        maxLength: maxLength,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        inputFormatters: inputFormatters, 
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: labelText,
          isDense: true,
        ),
      ),
    );
  }
}
