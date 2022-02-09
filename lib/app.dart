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
      debugShowCheckedModeBanner: false,
      title: flavor,
      home: Scaffold(
        appBar: AppBar(
          title: Text(flavor),
        ),
        body: Container(),
      ),
    );
  }
}
