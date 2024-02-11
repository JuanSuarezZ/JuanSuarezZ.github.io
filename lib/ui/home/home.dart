import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const path = '/Home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("altura: ${size.height} - ancho: ${size.width}"),
      ),
    );
  }
}
