import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pupaadmin/modules/auth/presentation/pages/auth_pages.dart';
import 'package:pupaadmin/modules/router/config.dart';
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
