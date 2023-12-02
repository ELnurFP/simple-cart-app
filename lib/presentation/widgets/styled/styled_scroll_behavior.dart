import 'dart:io';

import 'package:flutter/material.dart';

class StyledScrollBehavior extends ScrollBehavior {
  const StyledScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return Platform.isAndroid
        ? const ClampingScrollPhysics()
        : const BouncingScrollPhysics();
  }
}
