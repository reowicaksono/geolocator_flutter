import 'package:flutter/material.dart';
import 'package:presence_app/app.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    return Future.value(true);
  });
}

void main() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  runApp(const PrecenseApp());
}
