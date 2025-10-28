import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sama/config/navigation/routers/routes.dart';
import 'package:sama/config/navigation/routers/routes_location.dart';

final navigationKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteLocation.splash,
    navigatorKey: navigationKey,
    routes: routes,
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('404 - Page Not Found'))),
  );
});
