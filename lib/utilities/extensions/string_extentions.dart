import 'package:flutter/material.dart';

extension StringX on String? {
  bool get isValidString {
    return this != null && this!.trim().isNotEmpty && this!.trim() != 'null';
  }

  String asValidString([String fallback = 'N/A']) {
    return isValidString ? this! : fallback;
  }

  Widget buildRotatedText(bool showCard) {
    return RotatedBox(
      quarterTurns: showCard ? 0 : 2,
      child: Text(
        this!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  List<Widget> buildRotatedTextWidgets(bool showCard) {
    List<Widget> widgets = [];

    for (int i = 0; i < this!.length; i += 4) {
      widgets.add(this!.substring(i, i + 4).buildRotatedText(showCard));
      if (i < this!.length - 4) {
        widgets.add(const SizedBox(width: 10));
      }
    }

    return widgets;
  }
}
