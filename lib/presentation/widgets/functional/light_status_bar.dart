import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightStatusbar extends StatelessWidget {
  final Widget child;

  const LightStatusbar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: child,
    );
  }
}
