import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_cal/utils/modes.dart';

class SGPA extends StatelessWidget {
  final double initialValue;
  final Function(double) onChanged;

  SGPA({
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller =
        TextEditingController(text: initialValue.toString());
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
    return Expanded(
      child: TextField(
        cursorColor: isDarkMode(context) ? Colors.white : Colors.black,
        decoration: InputDecoration(
          labelText: 'SGPA',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        //initialValue: initialValue.toString(),
        controller: _controller,
        inputFormatters: [
          // FilteringTextInputFormatter.allow(RegExp(r'^[0-3](\.[0-9]?)?|^4(\.0)?$')),
          FilteringTextInputFormatter.allow(
              RegExp(r'^[0-3](\.[0-9]{0,2})?|^4(\.0{0,2})?$'))
        ],
        onChanged: (value) {
          if (value.isNotEmpty) {
            double sgpa = double.parse(value);
            if (sgpa < 0) {
              sgpa = sgpa.abs();
            }
            if (sgpa > 4.0) {
              sgpa = 4.0;
            }
            onChanged(sgpa);
          }
        },
      ),
    );
  }
}
