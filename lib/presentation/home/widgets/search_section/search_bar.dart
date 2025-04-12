import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 23, bottom: 23),
      width: double.infinity,
      height: 62,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.search_outlined, color: Color(0xFFA0A5BA), size: 20),
          SizedBox(width: 12),
          Text(
            'Search dishes, restaurants',
            style: TextStyle(color: Color(0xFF676767), fontSize: 14),
          ),
        ],
      ),
    );
  }
}
