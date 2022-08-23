import 'package:flutter/material.dart';
import '../input/base_input_field.dart';
import '../text/app_text.dart';

class AppDropDown<T> extends StatelessWidget {
  final String? title;
  final String? hint;
  final T? value;
  final List<DropdownMenuItem<T>> list;
  final List<Widget> Function(BuildContext context)? selectedItemBuilder;
  final String? errorText;
  final Function(T?)? onChanged;
  final IconData? iconData;
  final AutovalidateMode autovalidateMode;
  final Icon? prefixIcon;
  final String? Function(T?)? validator;

  AppDropDown({this.title,
    this.hint,
    this.value,
    required this.list,
    this.selectedItemBuilder,
    this.errorText,
    this.onChanged,
    this.iconData = Icons.keyboard_arrow_down,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return BaseInputField(
      title: title,
      inputControl: DropdownButtonFormField<T>(
        selectedItemBuilder: selectedItemBuilder,
        hint: AppText.body(hint),
        iconSize: 24,
        icon: iconData != null
            ? Icon(iconData)
            : Icon(Icons.keyboard_arrow_down_sharp),
        value: value,
        isDense: true,
        isExpanded: true,
        decoration: InputDecoration(
          // enabledBorder: InputBorder.none,
          // focusedBorder: InputBorder.none,
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          prefixIcon: prefixIcon,
        ),
        onChanged: onChanged,
        items: list,
        autovalidateMode: autovalidateMode,
        validator: validator,
      ),
    );
  }
}

class DropdownModel {
  DropdownModel({this.id, this.value});

  final String? id;
  final String? value;
}
