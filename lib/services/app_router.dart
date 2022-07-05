// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_flutter/screens/recycler_bin.dart';
import 'package:to_do_flutter/screens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecyclerBin.id:
        return MaterialPageRoute(
          builder: (_) => RecyclerBin(),
        );
      case TaskScreen.id:
        return MaterialPageRoute(
          builder: (_) => TaskScreen(),
        );
      default:
        return null;
    }
  }
}
