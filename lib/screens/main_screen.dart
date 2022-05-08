// ignore_for_file: prefer_const_constructors, prefer_final_fields

import "package:flutter/material.dart";
import 'package:shared_preferences_app/prefernces/app_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = AppPreferences().counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Counter", style: TextStyle(color: Colors.white)),
        // centerTitle: true,
        // elevation: 0,
        // backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                bool clear = await AppPreferences().removeCounterValue();
                if (clear) {
                  setState(() {
                    _counter = 0;
                  });
                }
              },
              icon: Icon(Icons.clear, color: Colors.white)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
            AppPreferences().saveCounter(
                counter:
                    _counter); // we don't have to put this line in the setState because its effect is not visible on the screen.
          });
        },
      ),
      body: Center(
        child: Text("Counter: $_counter"),
      ),
    );
  }
}
