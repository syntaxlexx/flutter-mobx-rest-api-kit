import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

List adminRoles = List<String>.from(['admin', 'sudo']);

DateTime? convertToDateTime(String? date) {
  if (date == null) {
    return null;
  }
  return DateTime.parse(date);
}

String fromNow(DateTime d) {
  return timeago.format(d);
}

String formatDate(DateTime? d, {String format = 'dd-MM-yyyy'}) {
  return d != null ? DateFormat(format).format(d) : '';
}

String formatTime(DateTime? d) {
  return d != null ? DateFormat.Hms().format(d) : '';
}

int parseInt(String string) {
  return double.parse(string).toInt();
}

String formatNumber(var number) {
  var f = NumberFormat('#,###.00', 'en_US');
  return number != null ? f.format(double.parse(number.toString())) : '';
}

String formatInt(var number) {
  var f = NumberFormat('#,###', 'en_US');
  return number != null ? f.format(double.parse(number.toString())) : '';
}

void showToast(BuildContext context, {String message = 'Action Successful'}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      // duration: const Duration(seconds: 2),
    ),
  );
}

String? validateNullableField(String? value,
    {int minLength = 2, int maxLength = 50}) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (value.isNotEmpty) {
    if (value.length < minLength) {
      return 'The field must be more than $minLength characters';
    }
    if (value.length > maxLength) {
      return 'The field must be less than $minLength characters';
    }
    return null;
  }
  return null;
}

String? validateRequiredField(String? value,
    {int minLength = 2, int maxLength = 50}) {
  if (value == null || value.isEmpty) {
    return 'The field is required';
  }
  if (value.isNotEmpty) {
    if (value.length < minLength) {
      return 'The field must be more than $minLength characters';
    }
    if (value.length > maxLength) {
      return 'The field must be less than $minLength characters';
    }
    return null;
  }
  return null;
}

String? validateNullableEmail(String? value,
    {int minLength = 2, int maxLength = 50}) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (value.isNotEmpty) {
    if (value.length < minLength) {
      return 'The field must be more than $minLength characters';
    }

    if (value.length > maxLength) {
      return 'The field must be less than $minLength characters';
    }

    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

    if (!emailValid) {
      return 'Please provide a valid email';
    }
  }
  return null;
}

// Black:   \x1B[30m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Magenta: \x1B[35m
// Cyan:    \x1B[36m
// White:   \x1B[37m
// Reset:   \x1B[0m
void dd(String text) {
  // ignore: avoid_print
  print('\x1B[35m$text\x1B[0m');
}

void printError(String text) {
  // ignore: avoid_print
  print('\x1B[31m$text\x1B[0m');
}
