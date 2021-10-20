import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pupaadmin/router/config.dart';
import 'package:pupaadmin/router/pages/auth_pages.dart';

class AppRouterDelegate extends RouterDelegate<RouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfig> {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Navigator(
      pages: [AuthPages.login],
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfig configuration) =>
      SynchronousFuture(null);
}
//STATE --------------------------------
