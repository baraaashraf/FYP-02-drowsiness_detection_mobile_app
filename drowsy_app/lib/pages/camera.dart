//import 'package:app_settings/app_settings.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:path/path.dart';
import 'package:drowsy_app/utils/functions.dart';

late List<CameraDescription> cameras; //global
late CameraController cameraController; //global
bool isStopped = false; //global
var score = 0;



class camera extends StatefulWidget {
  const camera({Key? key}) : super(key: key);

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {

@override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();

    cameraController = CameraController(
        cameras[1],
        ResolutionPreset.high,
        enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if(!mounted) {
        return;
      }
      setState(() {}); //To refresh widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff000000),
        ),
        body: Stack(
          children: [
                    Container(
                      child: CameraPreview(cameraController),
                    ),
             Row(
                   crossAxisAlignment: CrossAxisAlignment.end,
                     children:[
                     Expanded(
                       flex: 2,
                       child:Container(
                            color: Color(0xff631c1c),
                            padding: EdgeInsets.all(20.0),
                            child:  Text('${result}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                //fontWeight: FontWeight.bold
                              )
                          ),
                        ),
                     ),

                      Expanded(
                      flex: 2,
                      child: Container(
                             color: Color(0xff631c1c),
                             padding: EdgeInsets.all(20.0),
                             child: Text('Score: ${score}',
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 25,
                                   //fontWeight: FontWeight.bold
                                 )
                             ),
                           ),
                      ),
                       ],
                     ),
                   ],
                 ),
            );

    } else {
      return const SizedBox();
    }
  }
}


photoTimer() async {
  Timer.periodic(Duration(seconds: 5), (timer) {
    if (isStopped) {
      timer.cancel();
    }
    cameraController.takePicture().then((XFile? file) {
      // if (mounted) {
      if (file != null) {
        print("Picture saved to ${file.path}");
        upload(File(file.path));
        // create a simple flask to recv an image [done]
        // send this image to somewhere [?]
        // send this image to somewhere [?]
        // }
      }
    });
  });
}



