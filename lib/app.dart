import 'package:flavor_test/config/flavor_banner.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final String flavor;

  const App({
    Key? key,
    required this.flavor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: flavor,
      home: FlavorBanner(
        child: Scaffold(
          appBar: AppBar(
            title: Text(flavor),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
