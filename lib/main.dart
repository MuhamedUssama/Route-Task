import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'route_task.dart';

void main() {
  configureDependencies();
  runApp(const RouteTask());
}
