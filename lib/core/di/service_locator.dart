import 'package:get_it/get_it.dart';

import 'package:delivery/domain/domain.dart';
import 'package:delivery/presentation/presentation.dart';
import 'package:delivery/infrastructure/infrastructure.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  // Registramos la implementación de la interfaz LocationService
  locator.registerLazySingleton<LocationService>(() => GeolocatorService());

  // 🚦 Bloc que orquesta la lógica de ubicación usando el servicio
  locator.registerLazySingleton<LocationBloc>(
    () => LocationBloc(locator<LocationService>()),
  );
}
