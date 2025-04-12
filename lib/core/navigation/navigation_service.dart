abstract class NavigationService {
  void pop();
  void push(String route, {Object? extra});
  void pushNamed(String routeName, {Map<String, String>? parameters, Map<String, String>? queryParameters, Object? extra});
  void replace(String route, {Object? extra});
  void replaceNamed(String routeName, {Map<String, String>? parameters, Map<String, String>? queryParameters, Object? extra});
}