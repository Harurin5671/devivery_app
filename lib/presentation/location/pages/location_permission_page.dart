import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery/common/common.dart';
import 'package:delivery/presentation/presentation.dart';
// import 'package:delivery/domain/domain.dart';
// import 'package:delivery/infrastructure/infrastructure.dart';

class LocationPermissionPage extends StatelessWidget {
  static const String routePath = '/location_permission';
  static const String routeName = 'location_permission_page';

  const LocationPermissionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
        print('State: $state');
        if (state is LocationPermissionDenied) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Permiso denegado')));
        }

        if (state is LocationPermissionPermanentlyDenied) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Debes habilitar permisos desde ajustes')),
          );
        }

        if (state is LocationServiceDisabled) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Activa tu GPS para continuar')),
          );
        }

        if (state is LocationLoaded) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text('Ubicación obtenida: ${state.address}')),
          // );
          AppNavigation().replaceNamed(HomePage.routeName);

          // Aquí podrías redirigir a la home o siguiente paso
          // AppNavigation(router: appRouter).replaceNamed(HomePage.routeName);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 206,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF98A8B8),
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
                const SizedBox(height: 30),
                AppButton(
                  icon: Icons.location_on_outlined,
                  iconPosition: AppButtonIconPosition.right,
                  text: 'Access Location',
                  onPressed: () async {
                    // final status = await GeolocatorService().requestPermission();
                    // if(status == LocationPermissionStatus.granted) {
                    //   // final location = await GeolocatorService().getCurrentLocation();
                    //   // final address = await GeolocatorService().getAddressFromCoordinates(location.latitude, location.longitude);
                    // }
                    context.read<LocationBloc>().add(
                      CheckLocationStatusEvent(),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  'DFOOD WILL ACCESS YOUR LOCATION\nONLY WHILE USING THE APP',
                  style: TextStyle(fontSize: 16, color: Color(0xFF646982)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
