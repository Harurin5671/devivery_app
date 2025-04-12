import 'package:flutter/material.dart';

import 'package:delivery/presentation/presentation.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuAndDeliverySection(),
          ShoppingCartButton(),
        ],
      ),
    );
  }
}