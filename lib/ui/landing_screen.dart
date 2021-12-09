import 'package:flutter/material.dart';
import 'package:flutter_facial_recognition/ui/camera_app.dart';

class SybylFacialRecognitionLandingScreeen extends StatelessWidget {
  const SybylFacialRecognitionLandingScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SybylFacialRecognition()));
              },
              child: const Text('Go to facial page'))
        ]));
  }
}
