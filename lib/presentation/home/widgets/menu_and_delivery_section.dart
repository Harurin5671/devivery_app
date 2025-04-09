import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery/core/core.dart';
import 'package:delivery/presentation/presentation.dart';

class MenuAndDeliverySection extends StatelessWidget {
  const MenuAndDeliverySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Menu(), const SizedBox(width: 18), DeliveryLocation()],
    );
  }
}

// import 'package:flutter/material.dart';

class DeliveryLocation extends StatelessWidget {
  const DeliveryLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DELIVER TO',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFC6E2A),
          ),
        ),
        BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            // (1) Elegimos cuál widget mostramos según el estado
            print('State: $state');
            Widget child;
            if (state is LocationLoaded) {
              child = Row(
                key: const ValueKey('LocationLoadedWidget'),
                children: [
                  Text(
                    state.address,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF676767),
                    ),
                  ),
                  const SizedBox(width: 9),
                  const Icon(Icons.arrow_drop_down, color: Color(0xFF181C2E)),
                ],
              );
            } else if (state is LocationPermissionGranted) {
              child = const _LoadingDots(
                key: ValueKey('LocationLoadingWidget'),
              );
            } else if(state is LocationInitial) {
              child = const Text(
                '',
                key: ValueKey('LocationInitialWidget'),
                style: TextStyle(fontSize: 14, color: Color(0xFF676767)),
              );
            } else if(state is LocationLoading) {
              child = const _LoadingDots(
                key: ValueKey('LocationLoadingWidget'),
              );
            }
            else {
              child = const Text(
                'No se encontró una dirección',
                key: ValueKey('LocationNoAddressWidget'),
                style: TextStyle(fontSize: 14, color: Color(0xFF676767)),
              );
            }

            // (2) Retornamos un AnimatedSwitcher que hará la animación
            return Align(
              alignment: Alignment.centerLeft, // ⬅️ Siempre a la izquierda
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 650),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,

                // Evitamos que el widget saliente reserve espacio
                layoutBuilder:
                    (currentChild, previousChildren) => currentChild!,

                transitionBuilder: (widget, animation) {
                  final offsetAnim = Tween<Offset>(
                    begin: const Offset(0, 0.15),
                    end: Offset.zero,
                  ).animate(animation);

                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(position: offsetAnim, child: widget),
                  );
                },
                child: child, // tu Row con la dirección o el _LoadingDots
              ),
            );
          },
        ),
      ],
    );
  }
}

class _LoadingDots extends StatefulWidget {
  const _LoadingDots({super.key});

  @override
  State<_LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<_LoadingDots> {
  int dotCount = 0;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      setState(() {
        dotCount = (dotCount + 1) % 4;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dots = '.' * dotCount;
    return Text(
      'Cargando$dots',
      style: const TextStyle(fontSize: 14, color: Color(0xFF676767)),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Color(0xFFECF0F4),
        shape: BoxShape.circle,
      ),
      child: Image.asset(AppImages.menu),
    );
  }
}
