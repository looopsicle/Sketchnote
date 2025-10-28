import 'package:flutter/foundation.dart' show immutable;

@immutable
class RouteLocation {
  const RouteLocation._();

  static String get splash => '/splash';
  static String get notes => '/notes';
  static String get folders => '/folders';
  static String get calendar => '/calendar';
  static String get profile => '/profile';
}
