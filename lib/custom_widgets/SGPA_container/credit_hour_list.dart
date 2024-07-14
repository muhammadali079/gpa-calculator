import 'package:flutter/material.dart';

class CreditHours extends StatelessWidget {
  final int initialValue;
  final Function(int) onChanged;

  CreditHours({required this.initialValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: initialValue,
      hint: Text('Select Credit Hours'),
      items: [0, 1, 2, 3, 4].map((e) {
        return DropdownMenuItem<int>(
          value: e,
         child: Text(e == 0 ? 'Select Credit Hours' : e.toString()),
        );
      }).toList(),
      onChanged: (int? selectedHours) {
        if (selectedHours != null) {
          onChanged(selectedHours);
        }
      },
    );
  }
}
