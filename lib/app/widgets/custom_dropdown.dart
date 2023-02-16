import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.width,
      required this.margin,
      required this.changed,
      required this.value,
      required this.items});
  final double width;
  final EdgeInsetsGeometry margin;
  final ValueChanged<T?> changed;
  final T value;
  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      margin: margin,
      child: Material(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Container(
          height: 40,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                autofocus: false,
                elevation: 8,
                value: value,
                items: items,
                onChanged: changed),
          ),
        ),
      ),
    );
  }
}
