import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    final cleaned = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleaned.length > 8) {
      return oldValue;
    }

    var newText = '';
    var newSelectionIndex = newValue.selection.hashCode;
    for ( var i = 0; i < cleaned.length; i++) {
      if (i == 2 || i == 4) {
        newText += '-';
      }
      newText += cleaned[i];
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.fromPosition(TextPosition(offset: newSelectionIndex)),
    );
  }
}