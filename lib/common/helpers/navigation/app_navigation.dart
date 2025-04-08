import 'package:go_router/go_router.dart';

import 'package:delivery/core/core.dart';

class AppNavigation {
  final GoRouter _router;

  AppNavigation({GoRouter? router}) : _router = router ?? appRouter;

  void pop() {
    if (_router.canPop()) {
      _router.pop();
    }
  }
  void push(String route, {Object? extra}) {
    _router.push(route, extra: extra);
  }
  void pushNamed(
    String routeName, {
    Map<String, String>? parameters,
    Map<String, String>? queryParameters,
    Object? extra,
  }) {  
    _router.pushNamed(
      routeName,
      pathParameters: parameters ?? {},
      queryParameters: queryParameters ?? {},
      extra: extra,
    );
  }

  void replace(String route, {Object? extra}) {
    _router.go(route, extra: extra);
  }

  void replaceNamed(
    String routeName, {
    Map<String, String>? parameters,
    Map<String, String>? queryParameters,
    Object? extra,
  }) {
    _router.goNamed(routeName, pathParameters: parameters ?? {}, queryParameters: queryParameters ?? {}, extra: extra);
  }
}
