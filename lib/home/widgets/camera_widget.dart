import 'package:camera/camera.dart';
import 'package:fastcam_flutter_beamin/main.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController? controller;
  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    controller?.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller?.value.isInitialized ?? false
          ? CameraPreview(controller!)
          : Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
