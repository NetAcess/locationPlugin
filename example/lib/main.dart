import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:my_loc/my_loc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _myLocPlugin = MyLoc();

  String _platformVersion = 'Unknown';
  String _androidVersion = '-';
  String _appVersion = '-';
  String _getArch = '-';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
            ElevatedButton(onPressed: () async {
              String platformVersion = "";
              try {
                platformVersion = await _myLocPlugin.getCurrentLocation() ?? 'Unknown platform version';
              } on PlatformException {
                platformVersion = 'Failed to get platform version.';
              }
              setState(() {
                _platformVersion = platformVersion;
              });
            }, child: Text("GetCurrentLoc")),

            Center(
              child: Text('Running on: $_androidVersion\n'),
            ),
            ElevatedButton(onPressed: () async {
              String androidVersion = "";
              try {
                androidVersion = await _myLocPlugin.getAndroidVersion() ?? 'Unknown android version';
              } on PlatformException {
                androidVersion = 'Failed to get android version.';
              }
              setState(() {
                _androidVersion = androidVersion;
              });

            }, child: Text("getAndroidVersion")),

            Center(
              child: Text('Running on: $_appVersion\n'),
            ),
            ElevatedButton(onPressed: () async {
              String appVersion = "";
              try {
                appVersion = await _myLocPlugin.getAppVersion() ?? 'Unknown app version';
              } on PlatformException {
                appVersion = 'Failed to get app version.';
              }
              setState(() {
                _appVersion = appVersion;
              });

            }, child: Text("GetAppVersion")),

            Center(
              child: Text('Running on: $_getArch\n'),
            ),
            ElevatedButton(onPressed: () async {
              String getArch = "";
              try {
                getArch = await _myLocPlugin.getArchitecture() ?? 'Unknown app version';
              } on PlatformException {
                getArch = 'Failed to get app version.';
              }
              setState(() {
                _getArch = getArch;
              });

            }, child: Text("getArch")),
          ],
        ),
      ),
    );
  }
}
