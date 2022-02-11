import 'package:flavor_test/app.dart';
import 'package:flavor_test/config/flavor_config.dart';
import 'package:flutter/material.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.development,
    color: Colors.red,
    values: FlavorValues(baseUrl: ""),
  );

  runApp(const App(flavor: 'Development'));
}
