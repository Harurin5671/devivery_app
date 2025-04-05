import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:delivery/core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
     routerConfig: appRouter,
    );
  }
}
