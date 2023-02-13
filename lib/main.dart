import 'package:flutter/cupertino.dart';
import 'package:stime_strack/Kanban_time_track.dart';
import 'package:stime_strack/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:stime_strack/core/utils/device.dart' as device;
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await device.initDeviceOrientation();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const KanbanTimeTrack(),
  );
}