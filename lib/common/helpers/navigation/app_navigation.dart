import 'package:go_router/go_router.dart';

class AppNavigation {
  final GoRouter router;

  AppNavigation({required this.router});

  void pop() {
    if (router.canPop()) {
      router.pop();
    }
  }

  void push(String route, {Object? extra}) {
    router.push(route, extra: extra);
  }

  void pushNamed(
    String routeName, {
    Map<String, String>? parameters,
    Map<String, String>? queryParameters,
    Object? extra,
  }) {
    router.pushNamed(
      routeName,
      pathParameters: parameters ?? {},
      queryParameters: queryParameters ?? {},
      extra: extra,
    );
  }

  void replace(String route, {Object? extra}) {
    router.go(route, extra: extra);
  }

  void replaceNamed(
    String routeName, {
    Map<String, String>? parameters,
    Map<String, String>? queryParameters,
    Object? extra,
  }) {
    router.goNamed(routeName, pathParameters: parameters ?? {}, queryParameters: queryParameters ?? {}, extra: extra);
  }
}
