import 'package:flutter/material.dart';
import 'package:flavor_test/utils/string_utils.dart';

enum Flavor { development, staging, production }

class FlavorValues {
  FlavorValues({required this.baseUrl});

  final String baseUrl;
  //Add other flavor specific values, e.g database name

}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;

  static late FlavorConfig _instance;

  factory FlavorConfig({
    required Flavor flavor,
    Color color = Colors.blue,
    required FlavorValues values,
  }) {
    _instance = FlavorConfig._internal(
        flavor, StringUtils.enumName(flavor.toString()), color, values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.production;

  static bool isDevelopment() => _instance.flavor == Flavor.development;

  static bool isStaging() => _instance.flavor == Flavor.staging;
}
