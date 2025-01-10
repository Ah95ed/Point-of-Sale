import 'package:flutter/material.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';

class NavObserver extends NavigatorObserver {
  NavObserver._();

  static final NavObserver _singleton = NavObserver._();

  static NavObserver get instance => _singleton;
  ValueNotifier<List<Route>> routeName = ValueNotifier<List<Route>>([]);

  void addPage(Route name) {
    logError('message add page');
    if (name != null && routeName.value.isNotEmpty) {
      final List<Route> list = List.from(routeName.value);
      list.add(name);
      routeName.value = list;
      // routeName.value.add(name);
    }

    void removePage(Route name) {
      logSuccess('message remove page');
      if (name != null && routeName.value.isNotEmpty) {
        final List<Route> list = List.from(routeName.value);
        list.remove(name);
        routeName.value = list;
      }
    }

    @override
    void didPush(Route route, Route? previousRoute) {
      addPage(route);
      super.didPush(route, previousRoute);
    }

    @override
    void didPop(Route route, Route? previousRoute) {
      removePage(route);
      super.didPop(route, previousRoute);
    }

    @override
    void didRemove(Route route, Route? previousRoute) {
      super.didRemove(route, previousRoute);
    }

    @override
    void didReplace({Route? newRoute, Route? oldRoute}) {
      super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    }
  }
}
