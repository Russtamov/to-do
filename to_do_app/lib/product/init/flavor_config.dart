import 'package:flutter/material.dart';

enum Flavor { dev, prod }

class AppConfig {
  final String appName;
  final String baseUrl;
  final Flavor flavor;
  final MaterialColor primaryColor;

  static late AppConfig _instance;

  static AppConfig get shared => _instance;

  AppConfig._internal({
    required this.appName,
    required this.baseUrl,
    required this.flavor,
    required this.primaryColor,
  });

  static void create({
    required String appName,
    required String baseUrl,
    required Flavor flavor,
    required MaterialColor primaryColor,
  }) {
    _instance = AppConfig._internal(
      appName: appName,
      baseUrl: baseUrl,
      flavor: flavor,
      primaryColor: primaryColor,
    );
  }
}
