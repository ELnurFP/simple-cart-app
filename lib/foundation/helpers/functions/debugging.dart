import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget errorWidgetBuilder(FlutterErrorDetails error) {
  return SafeArea(
    child: Container(
      color: Colors.indigo,
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Text(
          error.toString(),
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            height: 1.6,
          ),
        ),
      ),
    ),
  );
}

void logError(dynamic e, dynamic s) {
  if (e != null) debugPrint(e.toString());
  if (s != null) debugPrint(s.toString());

  if (kDebugMode) {
// show error dialog on debug mode
  }
}
