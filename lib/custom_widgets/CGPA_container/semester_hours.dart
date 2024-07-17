import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_cal/utils/modes.dart';

class CreditHours extends StatelessWidget {
  final int initialValue;
  final Function(int) onChanged;

  CreditHours({
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

       TextEditingController _controller = TextEditingController(text: initialValue.toString());
     _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
    return Expanded(
      child: TextField(
         cursorColor: isDarkMode(context) ? Colors.white : Colors.black,
        decoration: InputDecoration(
          labelText: 'Enter Credit Hours',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        //initialValue: initialValue.toString(),
        controller: _controller,
        onChanged: (value) {
          if (value.isNotEmpty) {
            int hours = int.parse(value);
           // hours = hours.clamp(0, 25);

            onChanged(hours);
          }
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^([0-9]|1[0-9]|2[0-5])?$'))
        ],
      ),
    );
  }
}
