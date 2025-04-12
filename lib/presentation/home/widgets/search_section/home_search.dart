import 'package:delivery/presentation/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Greeting(),
          SizedBox(height: 16),
          HomeSearchBar(),
        ],
      ),
    );
  }
}