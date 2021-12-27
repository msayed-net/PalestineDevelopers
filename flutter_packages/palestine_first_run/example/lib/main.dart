import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:palestine_first_run/palestine_first_run.dart';

void main() {
  // Make Sure Framework Is Ready
  WidgetsFlutterBinding.ensureInitialized();

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
    super.initState();
    Future.delayed(Duration.zero, () async {
      final bool isFirstRun = await PalFirstRun.isFirstRun();
      developer.log(isFirstRun.toString());

      final bool isFirstAPICall = await PalFirstRun.isFirstCall('call_api');
      developer.log(isFirstAPICall.toString());
    });
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
