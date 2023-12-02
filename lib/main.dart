import 'package:flutter/material.dart';
import 'utilities/exports/functions.dart';
import 'app.dart';

Future<void> main() async {
  await configureApp();

  runApp(
    const App(),
  );
}
