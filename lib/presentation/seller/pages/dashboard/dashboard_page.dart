import 'dart:developer';

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  static const String routePath = '/seller-dashboard';
  static const String routeName = 'seller_dashboard_page';
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      body: DashboardView(),
      bottomNavigationBar: _SellerBottomNavBar(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    const currentIndex = 0;
    return IndexedStack(
      index: currentIndex,
      children: const [
        Center(child: Text('1')),
        Center(child: Text('2')),
        Center(child: Text('3')),
        Center(child: Text('4')),
        Center(child: Text('5')),
      ],
    );
  }
}

class _SellerBottomNavBar extends StatelessWidget {
  const _SellerBottomNavBar();

  @override
  Widget build(BuildContext context) {
    final items = [
      Icons.grid_view_outlined,
      Icons.menu,
      Icons.add,
      Icons.notifications_none_rounded,
      Icons.person_outline_outlined,
    ];
    return SafeArea(
      top: false,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            final icon = items[index];
            final isCentral = index == 2;

            return _NavItem(
              icon: icon,
              isCentral: isCentral,
              isSelected: index == 0, // de momento solo el 0 seleccionado
              onTap: () {
                log('Index tapped: $index');
              },
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.onTap,
    this.isCentral = false,
    this.isSelected = false,
  });
  final IconData icon;
  final VoidCallback onTap;
  final bool isCentral;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 57,
            height: 57,
            padding: isCentral ? const EdgeInsets.all(6) : EdgeInsets.zero,
            decoration:
                isCentral
                    ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFF7622),
                        width: 1,
                      ),
                      color: isCentral ? Color(0xFFFFF1F2) : null,
                    )
                    : null,
            child: Icon(
              size: isCentral ? 24 : 24,
              icon,
              color:
                  isSelected || isCentral
                      ? const Color(0xFFFF7622)
                      : const Color(0xFFAFAFAF),
            ),
          ),
        ),
      ),
    );
  }
}
