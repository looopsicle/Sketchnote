import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sama/config/navigation/routers/routes_location.dart';
import 'package:sama/config/navigation/routers/routes_provider.dart';
import 'package:sama/app/ui/shell.dart';
import 'package:sama/features/notes/presentation/screens/home_screen.dart';
import 'package:sama/features/splash/presentation/splash_screen.dart';
// import 'package:sama/features/settings/presentation/settings_page.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = [
  GoRoute(
    path: RouteLocation.splash,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => const SplashScreen(),
  ),
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    pageBuilder: (context, state, child) =>
        NoTransitionPage(child: AppShell(child: child)),
    routes: [
      GoRoute(
        path: RouteLocation.notes,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HomeScreen()),
      ),
      // GoRoute(
      //   path: RouteLocation.settings,
      //   parentNavigatorKey: _shellNavigatorKey,
      //   pageBuilder: (context, state) => const NoTransitionPage(
      //     child: SettingsPage(),
      //   ),
      // ),
    ],
  ),
];
