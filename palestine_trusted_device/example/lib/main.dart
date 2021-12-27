import 'package:flutter/material.dart';
import 'package:palestine_trusted_device/palestine_trusted_device.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    PalTrustedDevice.check(
      checkRealDevice: true,
      checkDevMode: false,
      checkOnExternalStorage: false,
      checkRooted: true,
      onFail: () {
        // Not Secure Env Detected
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('Running on'),
        ),
      ),
    );
  }
}
