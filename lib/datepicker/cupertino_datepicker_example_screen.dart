import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDatePickerExampleScreen extends StatefulWidget {
  @override
  _CupertinoDatePickerExampleScreenState createState() => _CupertinoDatePickerExampleScreenState();
}

class _CupertinoDatePickerExampleScreenState extends State<CupertinoDatePickerExampleScreen> {
  DateTime? _selectedDate;

  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: _selectedDate ?? DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
            ),
            CupertinoButton(
              child: Text('完了'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoDatePicker サンプル'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => _showCupertinoDatePicker(context),
              child: Text(_selectedDate == null
                  ? '日付未選択'
                  : '選択した日付: ${_selectedDate!.toString().split(' ')[0]}'),
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
        ),
      ),
    );
  }
}
