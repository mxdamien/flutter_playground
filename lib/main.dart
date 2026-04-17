import 'package:flutter/material.dart';
import 'app.dart';

import 'package:flutter_playground/core/di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  runApp(const MyApp());
}
