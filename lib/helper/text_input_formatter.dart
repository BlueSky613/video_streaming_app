import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Only allows digits
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Formatting logic
    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      if (i == 2 || i == 5) {
        buffer.write('-'); // Add dashes at the 3rd and 6th position
      }
    }

    // Handle case where deleting characters results in trailing dash
    var formatted = buffer.toString();
    if (formatted.endsWith('-')) {
      formatted = formatted.substring(0, formatted.length - 1);
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
