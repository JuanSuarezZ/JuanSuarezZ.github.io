///[flutter]
import 'package:flutter/material.dart';
import 'package:flutterappweb/core/navigator.key.dart';
import 'package:flutterappweb/ui/about/about.dart';
import 'package:flutterappweb/ui/home/home.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: HomePage.path,
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    ShellRoute(
      navigatorKey: navigatorkey,
      routes: [
        GoRoute(
          path: AboutPage.path,
          builder: (BuildContext context, GoRouterState state) {
            return const AboutPage();
          },
        ),
        GoRoute(
          path: HomePage.path,
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
      ],
      builder: (context, state, child) {
        return Scaffold(
          body: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child,
          ),
        );
      },
    ),
  ],
);

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(HomePage.path),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
