import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import '../common/file_util.dart';
import '../base/base_stateful_widget.dart';


class User {
  String name = "";
  String age = "";
  String location = "";
  List<dynamic> files = [];

  User();

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        location = json['location'],
        files = json['files'];
   /*
    User.fromJson(Map json)
      : name = json['name'],
        age = json['age'],
        location = json['location'],
        files = json['files'];
    */

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'location': location,
    'files': files,//.map((e) => e.path)
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

class SharedUserExampleScreenResult {
  final String message;
  SharedUserExampleScreenResult(this.message);
}

class SharedUserExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SharedUserExampleScreenState();
  }
}

class _SharedUserExampleScreenState extends BaseState<SharedUserExampleScreen> {
  _SharedUserExampleScreenState() : super();

  SharedPref sharedPref = SharedPref();
  User userSave = User();
  User userLoad = User();

  loadSharedPrefs() async {
    try {
      User user = User.fromJson(await sharedPref.read("user"));
      print(user);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: new Text("Loaded!"),
          duration: const Duration(milliseconds: 500)));
      setState(() {
        userLoad = user;
      });
    } catch (Excepetion) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: new Text("Nothing found!"),
          duration: const Duration(milliseconds: 500)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //endDrawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('SharedPreference Simple examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Name"),
                      onChanged: (value) {
                        setState(() {
                          userSave.name = value;
                        });
                      },
                    )),
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Age"),
                      onChanged: (value) {
                        setState(() {
                          userSave.age = value;
                        });
                      },
                    )),
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Location"),
                      onChanged: (value) {
                        setState(() {
                          userSave.location = value;
                        });
                      },
                    )),
              ],
            ),
          ),
          Container(
            height: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    final File file1 = await getImageFileFromAssets('images/DSCF9613.JPG');
                    final File file2 = await getImageFileFromAssets('images/DSCF9617.JPG');
                    userSave.files = [file1.path, file2.path];
                    print(userSave);
                    sharedPref.save("user", userSave);

                    List<String> myData =
                    [userSave].map((f) => json.encode(f.toJson())).toList();

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    // ④保存
                    await prefs.setStringList("testKey", myData);

                    print('保存したmyData: $myData');

                    String saveStr = json.encode(userSave.toJson());
                    //await prefs.setStringList("testKeyStr", myData);
                    await prefs.setString("testKeyStr", saveStr);
                    print('保存したStr myData: $saveStr');

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: new Text("Saved!"),
                        duration: const Duration(milliseconds: 500)));
                  },
                  child: Text('Save', style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    loadSharedPrefs();

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    // ①読み出し
                    var result = prefs.getString("testKeyStr");

                    print('読み出したresult:$result');
                    print(json.decode(result!));

                    final u = User.fromJson( json.decode(result!) );
                    print(u);
                    print(u.name);
                    print(u.files);

                    /*
                    //const u = User.fromJson(json.decode(result));
                    //const testData = [result].map((f) => User.fromJson(json.decode(f)));
                    //print(json.decode(prefs.getStringList("testKeyStr")));
                    print(result![0]);
                    print( json.decode(result![0]) );

                    print( prefs.getStringList("testKeyStr")![0] );

                    print(json.decode(result![0]).runtimeType);
                    // User 単体
                    print( User.fromJson( json.decode(prefs.getStringList("testKeyStr")![0]) ));
                    final u = User.fromJson( json.decode(prefs.getStringList("testKeyStr")![0]) );
                    print(u.name);
                    print(u.files);
                    */

                  },
                  child: Text('Load', style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    sharedPref.remove("user");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: new Text("Cleared!"),
                        duration: const Duration(milliseconds: 500)));
                    setState(() {
                      userLoad = User();
                    });
                  },
                  child: Text('Clear', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Name: " + (userLoad.name ?? ""),
                    style: TextStyle(fontSize: 16)),
                Text("Age: " + (userLoad.age ?? ""),
                    style: TextStyle(fontSize: 16)),
                Text("Location: " + (userLoad.location ?? ""),
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      )
    );
  }
}
