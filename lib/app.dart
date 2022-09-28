import 'package:flutter/material.dart';

import './core/theme/theme.dart';
import './features/splash/presentaion/views/splash_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
