import 'dart:convert';

import 'package:flutter/material.dart';

Widget errorText(BuildContext context, String text) {
  return Text(text, style: TextStyle(color: Theme.of(context).errorColor));
}

Widget errorMessage(BuildContext context, {String? error}) {
  return error != null && error.isNotEmpty
      ? Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).errorColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.error_outline, color: Theme.of(context).errorColor),
              const SizedBox(
                width: 5.0,
              ),
              Flexible(child: errorText(context, error)),
            ],
          ),
        )
      : Container();
}

class LaravelValidationErrors extends StatefulWidget {
  final String? json;

  const LaravelValidationErrors(this.json, {super.key});

  @override
  State<LaravelValidationErrors> createState() =>
      _LaravelValidationErrorsState();
}

class _LaravelValidationErrorsState extends State<LaravelValidationErrors> {
  List messages = [];

  @override
  void initState() {
    super.initState();

    if (widget.json != null && widget.json!.length > 1) {
      formatFromJson(widget.json as String);
    }
  }

  void formatFromJson(String json) {
    final errorMessages = <String>[];

    jsonDecode(json).forEach((key, value) {
      if (key == 'errors') {
        // Map<String, dynamic> map = Map<String, dynamic>.from(json[key]);
        // map.forEach((mapKey, value) {
        //   errorMessages.add(map[mapKey][0] as String);
        // });
      }
    });

    setState(() {
      messages = errorMessages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return messages.isNotEmpty
        ? Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).errorColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.error_outline, color: Theme.of(context).errorColor),
                const SizedBox(
                  width: 5.0,
                ),
                Flexible(child: errorText(context, messages.join('\n'))),
              ],
            ),
          )
        : Container();
  }
}
