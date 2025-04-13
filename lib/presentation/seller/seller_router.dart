import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/dashboard/dashboard.dart';

final List<GoRoute> sellerRoutes = [
  GoRoute(
    path: DashboardPage.routePath,
    name: DashboardPage.routeName,
    builder:
        (context, state) => BlocProvider(
          create: (context) => DashboardTabBloc(),
          child: const DashboardPage(),
        ),
  ),
];
