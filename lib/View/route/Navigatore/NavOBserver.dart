import 'package:flutter/material.dart';

class NavObserver extends NavigatorObserver {
  NavObserver._();

  static final NavObserver _singleton = NavObserver._();

  static NavObserver get instance => _singleton;
 

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    // TODO: implement didRemove
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    // TODO: implement didReplace
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
  
}
