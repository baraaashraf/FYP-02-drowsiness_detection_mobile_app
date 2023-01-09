import 'package:app_settings/app_settings.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:drowsy_app/utils/functions.dart';
import 'dart:async';
import 'package:drowsy_app/pages/camera.dart';




class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);
  // create an object of camera class


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff631c1c),
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
      ),
      drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff631c1c),
                ),
                child: Text('Drowsiness Detection',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    )
                ),
              ),
              ListTile(
                title: const Text('Home',
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: 25,
                      //fontWeight: FontWeight.bold
                    )
                ),
                onTap: () {
                  AppSettings.openAppSettings();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('App Settings',
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: 25,
                      //fontWeight: FontWeight.bold
                    )
                ),
                onTap: () {
                  AppSettings.openAppSettings();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Options',
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: 25,
                      //fontWeight: FontWeight.bold
                    )
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/options');
                },
              ),
            ],
          )
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                    'Drowsy Driver Detector',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
              const SizedBox(height: 350),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/camera');
                  photoTimer();
                },
                child: const Text('Start'),
              ),
              const SizedBox(height: 90),
              Center(
                child: Text(
                    "This app requires access to phone's camera please enable access in phone settings.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    )
                ),
              ),
            ],
          )
      ),

    );
  }


  }

