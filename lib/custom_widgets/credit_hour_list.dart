import 'package:flutter/material.dart';

class CreditHours extends StatefulWidget {
  final Function(int)? onChanged;
  @override
  const CreditHours({Key? key, this.onChanged}) : super(key: key);

  @override
  State<CreditHours> createState() => _CreditHoursState();
}

class _CreditHoursState extends State<CreditHours> {
  final List<int> credit_hours = [0,1,2,3,4];
  int? _selectedCreditsHours;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: _selectedCreditsHours,
      hint: Text('Select Credit Hours'),
      items: credit_hours.map((e) {
        return DropdownMenuItem<int>(
          value: e,
          child: Text(e.toString()),
        );
      }).toList(), 
      onChanged: (int? selectedHours) {
        setState(() {
          _selectedCreditsHours = selectedHours;
        });
         if (widget.onChanged != null) {
          widget.onChanged!(selectedHours!);
        }
        print('Selected Credit Hours: $selectedHours');
      },
    );
  }
}