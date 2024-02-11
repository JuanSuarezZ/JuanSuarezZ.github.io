import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const path = '/About-page';
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("About Page"),
      ),
    );
  }
}
