import 'package:flutter/material.dart';

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText, VoidCallback? onIconClicked}) {
  return InputDecoration(
    // contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    // labelStyle: const TextStyle(color: Colors.grey),
    // fillColor: Colors.grey.shade200,
    // filled: true,
    prefixText: prefix,
    prefixIcon: onIconClicked == null
        ? Icon(
            iconData,
            size: 20,
          )
        : IconButton(
            icon: Icon(
              iconData,
              size: 20,
            ),
            onPressed: onIconClicked,
          ),
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    // enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: const BorderSide(color: Colors.black)),
    // focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: const BorderSide(color: Colors.black)),
    // errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: const BorderSide(color: Colors.black)),
    // border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: const BorderSide(color: Colors.black)),
  );
}
