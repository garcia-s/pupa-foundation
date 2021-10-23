import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pupaadmin/modules/router/config.dart';


class InformationParser extends RouteInformationParser<RouteConfig> {
  @override
  Future<RouteConfig> parseRouteInformation(
          RouteInformation routeInformation) =>
      SynchronousFuture(RouteConfig());
}
