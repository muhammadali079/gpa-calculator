import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_cal/utils/modes.dart';

class SGPA extends StatefulWidget {
  final double initialValue;
  final Function(double?) onChanged;

  SGPA({
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _SGPAState createState() => _SGPAState();
}

class _SGPAState extends State<SGPA> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue.toString());
    _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
  }

  @override
  void didUpdateWidget(covariant SGPA oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _controller.text = widget.initialValue.toString();
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        cursorColor: isDarkMode(context) ? Colors.white : Colors.black,
        decoration: InputDecoration(
          labelText: 'SGPA',
          border: OutlineInputBorder(),
        ),
        controller: _controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[0-3](\.[0-9]{0,2})?|^4(\.0{0,2})?$')),
        ],
        onChanged: (value) {
          if (value.isNotEmpty) {
            try {
              double sgpa = double.parse(value);
              widget.onChanged(sgpa);
            } catch (e) {
              print('error at sgpa : $e');
             // widget.onChanged(null);
            }
          } else {
            print("value is null");
          }
        },
      ),
    );
  }
}
