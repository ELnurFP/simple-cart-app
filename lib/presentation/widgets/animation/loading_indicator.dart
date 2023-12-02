import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  final double storkeWidth;

  const LoadingIndicator({
    Key? key,
    this.color,
    this.storkeWidth = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildIndicator(),
    );
  }

  Widget _buildIndicator() {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        color: color,
      );
    }

    return CircularProgressIndicator(
      color: color,
      strokeWidth: storkeWidth,
    );
  }
}
