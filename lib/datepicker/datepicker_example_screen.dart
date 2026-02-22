import 'package:flutter/material.dart';

class DatePickerExampleScreen extends StatefulWidget {
  @override
  _DatePickerExampleScreenState createState() =>
      _DatePickerExampleScreenState();
}

class _DatePickerExampleScreenState extends State<DatePickerExampleScreen> {
  DateTime? _selectedDate;

  void _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DatePicker Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
            onPressed: () => _pickDate(context),
            child: Text(_selectedDate == null
                ? '日付未選択'
                : '選択した日付: ${_selectedDate.toString().split(' ')[0]}'),
          ),
          if (_selectedDate != null)
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedDate = null;
                });
              },
              child: Text('選択解除'),
            ),
        ],
      )),
    );
  }
}
