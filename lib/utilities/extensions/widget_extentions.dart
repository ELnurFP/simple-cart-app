import 'package:flutter/material.dart';

extension WidgetX on Widget {
  /// Wraps around [MaterialPageRoute], removes unnecessary repeat of code.
  Route get route {
    return MaterialPageRoute(builder: (context) => this);
  }

  /// Gives specified padding to the top of [Widget]
  Widget padTop(double value) {
    return Padding(
      padding: EdgeInsets.only(top: value),
      child: this,
    );
  }

  /// Gives specified padding to the right side of [Widget]
  Widget padRight(double value) {
    return Padding(
      padding: EdgeInsets.only(right: value),
      child: this,
    );
  }

  /// Gives specified padding to the left side of [Widget]
  Widget padLeft(double value) {
    return Padding(
      padding: EdgeInsets.only(left: value),
      child: this,
    );
  }

  /// Gives specified padding to the bottom of [Widget]
  Widget padBottom(double value) {
    return Padding(
      padding: EdgeInsets.only(bottom: value),
      child: this,
    );
  }

  /// Gives specified padding to the [Widget] horizontally
  Widget padHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  /// Gives specified padding to the [Widget] vertically
  Widget padVertical(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  /// Gives specified padding to the all sides of [Widget]
  Widget padAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  /// Gives padding to the [Widget] with specified values for each side (left,
  /// top, right, bottom).
  ///
  /// Not specified sides gets 0.0 padding.
  Widget padOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  /// Wraps [Widget] around [SliverToBoxAdapter], hepful when you want to use
  /// a [Widget] inside [CustomScrollView].
  Widget toSliver() {
    return SliverToBoxAdapter(child: this);
  }

  /// Limits the [Widget] in width with specified value.
  Widget inWidthOf(double value) {
    return SizedBox(
      width: value,
      child: this,
    );
  }

  /// Limits the [Widget] in height with specified value.
  Widget inHeightOf(double value) {
    return SizedBox(
      height: value,
      child: this,
    );
  }

  /// Limits the [Widget] in width and height with specified value.
  Widget inSizeOf(double width, double height) {
    return SizedBox(
      height: height,
      width: width,
      child: this,
    );
  }

  // Widget inDevelopment([String? message]) {
  //   return InDevelopmentIndicator(
  //     message: message,
  //     child: this,
  //   );
  // }
}
