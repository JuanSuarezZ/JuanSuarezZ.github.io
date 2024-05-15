import 'package:flutter/material.dart';
import 'package:flutterappweb/ui/app/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App Web test',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
