//import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';


const List<String> list = <String>['alarm1', 'alarm2', 'alarm3', 'alarm4','alarm5'];

class options extends StatefulWidget {
  const options({Key? key}) : super(key: key);

  @override
  State<options> createState() => _optionsState();
}

const alarm1 = 'alarm1.mp3';
const alarm2 = 'alarm2.mp3';
const alarm3 = 'alarm3.mp3';
const alarm4 = 'alarm4.mp3';
const alarm5 = 'alarm5.mp3';


class _optionsState extends State<options> {
  String dropdownValue = list.first;
  final player = AudioPlayer();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                    'Options',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
              const SizedBox(height: 80),
              Text(
                  'Alarm sounds',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),



              const SizedBox(height: 200),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
                ),
                onPressed: () async {
                  final player = AudioPlayer();
                  player.play(UrlSource('alarm1.mp3'));
                 await player.play(AssetSource('alarms/alarm1.mp3'));
                },
                child: const Text('Test'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          )
      ),
    );
  }
}
