import 'dart:async';

import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  // Use named or Navigator 2
  //So we don't need these extensions
  void push(Widget page) {
    unawaited(
      Navigator.of(this).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      ),
    );
  }

  void pushReplacment(Widget page) {
    unawaited(
      Navigator.of(this).pushReplacement(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      ),
    );
  }

  void pop() => Navigator.pop(this);
}
