import 'package:flutter/material.dart';
import 'package:quran_app/global.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: _appBar(),
      body: SafeArea(child: Center(child: Text('Home Screen'))),
    );
  }

  AppBar _appBar() => AppBar(
    title: Row(
      children: [
      Text('Quran App')
    ]),
  );
}
