import 'core/core.config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppAnalytics().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              NativeChannelOpener.showAlarm(milliseconds: 5);

              // AppLogger().logInfo('Hello World');
              // AppLogger().logError('Hello World');
              // AppLogger().logDebug('Hello World');
              // AppLogger().logWarning('Hello World');

              // AppAnalytics().logTest();
              // AppAnalytics().logErrorTest();

              // FirebaseCrashlytics.instance.crash();
            },
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
