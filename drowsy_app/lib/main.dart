import 'dart:async';
//import 'package:app_settings/app_settings.dart';
import 'package:drowsy_app/pages/options.dart';
import 'package:drowsy_app/pages/home.dart';
import 'package:drowsy_app/pages/camera.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(

  routes: {
    '/': (context) => home(),
    '/options': (context) => options(),
    '/camera': (context) => camera(),
  },
));
