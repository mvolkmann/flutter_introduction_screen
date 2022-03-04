import 'package:flutter/material.dart';

extension ColumnExtension on Column {
  /// Adds a SizedBox with a given height and no width
  /// between all Widgets in the Column.
  Column gap(double size) {
    for (int i = children.length - 1; i > 0; i--) {
      children.insert(i, SizedBox(height: size));
    }
    return this;
  }
}

extension RowExtension on Row {
  /// Adds a SizedBox with a given width and no height
  /// between all Widgets in the Row.
  Row gap(double size) {
    for (int i = children.length - 1; i > 0; i--) {
      children.insert(i, SizedBox(width: size));
    }
    return this;
  }
}

extension WidgetExtension on Widget {
  Widget align([Alignment alignment = Alignment.centerLeft]) {
    return Container(alignment: alignment, child: this);
  }

  Widget backgroundColor(Color color) {
    return Container(color: color, child: this);
  }

  /// Wraps a widget in a Container that has a border.
  /// This is very useful for debugging.
  /// It is similar to the CSS property "outline: 1px solid red;".
  Widget border({Color color = Colors.red}) {
    /*
    // This is an attempt to avoid nesting Containers in Containers.
    // It doesn't work because all the Container properties are final.
    final container =
        runtimeType == Container ? this as Container : Container(child: this);
    container.decoration = BoxDecoration(border: Border.all(color: color));
    return container;
    */
    return Container(
      child: this,
      decoration: BoxDecoration(border: Border.all(color: color)),
    );
  }

  /// Wraps a widget in a Center.
  Widget get center => Center(child: this);

  /// Wraps a widget in an Expanded.
  Widget get expanded => Expanded(child: this);

  /// Wraps a widget in a Container with a given margin.
  Widget margin(EdgeInsets insets) => Container(child: this, margin: insets);

  /// Wraps a widget in a Row which can prevent
  /// expanding the width to match the parent width.
  Widget get row => Row(children: [this]);

  /// Wraps a widget in a SizedBox with a given width and height.
  Widget size({required double width, required double height}) {
    return SizedBox(child: this, height: height, width: width);
  }

  /// Wraps a widget in a Padding with a given horizontal padding.
  Widget hPadding(double size) {
    return Padding(
        child: this, padding: EdgeInsets.symmetric(horizontal: size));
  }

  /// Wraps a widget in a Padding with given padding on all sides.
  Widget padding(double size) {
    return Padding(child: this, padding: EdgeInsets.all(size));
  }

  Widget paddingOnly({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) {
    return Padding(
      child: this,
      padding: EdgeInsets.only(
        top: top,
        right: right,
        bottom: bottom,
        left: left,
      ),
    );
  }

  Widget textColor(Color color) {
    return DefaultTextStyle(style: TextStyle(color: color), child: this);
  }

  /// Wraps a widget in a Padding with a given horizontal padding.
  Widget vPadding(double size) {
    return Padding(child: this, padding: EdgeInsets.symmetric(vertical: size));
  }
}

extension WidgetListExtension<Widget> on List<Widget> {
  /// Adds a SizedBox with a given width and no height
  /// between all Widgets in the List.
  List<Widget> hSpacing(double size) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, SizedBox(width: size, height: 0) as Widget);
    }
    return this;
  }

  /// Adds a SizedBox with the same width and height
  /// between all Widgets in the List.
  List<Widget> spacing(double size) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, SizedBox(width: size, height: size) as Widget);
    }
    return this;
  }

  /// Adds a SizedBox with a given height and no width
  /// between all Widgets in the List.
  List<Widget> vSpacing(double size) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, SizedBox(width: 0, height: size) as Widget);
    }
    return this;
  }
}
