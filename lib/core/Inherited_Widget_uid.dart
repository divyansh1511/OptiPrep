import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  final String uid;

  MyInheritedWidget({required this.uid, required Widget child})
      : super(child: child);

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.uid != uid;
  }
}
