import 'dart:convert';

import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedSimpleExampleScreenResult {
  final String message;
  SharedSimpleExampleScreenResult(this.message);
}

class SharedSimpleExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SharedSimpleExampleScreenState();
  }
}

class _SharedSimpleExampleScreenState extends BaseState<SharedSimpleExampleScreen> {
  _SharedSimpleExampleScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //endDrawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('SharedPreference Simple examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: ElevatedButton(
            child: const Text('Save'),
            onPressed: () async {
              print('press');
            },
          )
      ),
    );
  }
}

class User {
  String name;
  String age;
  String location;

  //User();

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        location = json['location'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'location': location,
  };
}

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) == null) return;
    return json.decode(prefs.getString(key)!);
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}