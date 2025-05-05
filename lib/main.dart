import 'package:abdullansr/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; // Import flutter_riverpod

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(ProviderScope(child: const PortfolioApp()));
}
