import 'package:go_router/go_router.dart';

import 'package:delivery/core/core.dart';
import 'app_router.dart';

class AppNavigation implements NavigationService {
  final GoRouter _router;

  AppNavigation({GoRouter? router}) : _router = router ?? appRouter;
  
  @override
  void pop() {
    if (_router.canPop()) {
      _router.pop();
    }
  }
  
  @override
  void push(String route, {Object? extra}) {
    _router.push(route, extra: extra);
  }
  
  @override
  void pushNamed(String routeName, {Map<String, String>? parameters, Map<String, String>? queryParameters, Object? extra}) {
    _router.pushNamed(
      routeName,
      pathParameters: parameters ?? {},
      queryParameters: queryParameters ?? {},
      extra: extra,
    );
  }
  
  @override
  void replace(String route, {Object? extra}) {
    _router.go(route, extra: extra);
  }
  
  @override
  void replaceNamed(String routeName, {Map<String, String>? parameters, Map<String, String>? queryParameters, Object? extra}) {
    _router.goNamed(routeName, pathParameters: parameters ?? {}, queryParameters: queryParameters ?? {}, extra: extra);
  }
}
