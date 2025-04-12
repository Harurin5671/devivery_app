// import 'dart:developer';

// import 'package:flutter/material.dart';

// class HomeCategory extends StatelessWidget {
//   const HomeCategory({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> categories = [
//       'All',
//       'Hot Dog',
//       'Burger',
//       'Pizza',
//       'Drinks',
//     ];
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'All Categories',
//                 style: TextStyle(fontSize: 20, color: Color(0xFF32343E)),
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'See All',
//                     style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
//                   ),
//                   SizedBox(width: 10),
//                   Icon(
//                     Icons.arrow_forward_ios,
//                     color: Color(0xFFA0A5BA),
//                     size: 16,
//                     weight: 12,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 20),
//         SizedBox(
//           height: 70, // un poco más alto para dejar espacio a la sombra
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(
//               top: 10,
//               bottom: 10,
//               left: 24,
//               right: 10,
//             ),
//             itemCount: categories.length,
//             separatorBuilder: (_, __) => const SizedBox(width: 12),
//             itemBuilder: (context, index) {
//               final category = categories[index];
//               return Material(
//                 elevation: 4,
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(39),
//                 clipBehavior: Clip.none,
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(39),
//                   onTap: () {
//                     log('Category selected: $category');
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       left: 8,
//                       top: 8,
//                       bottom: 8,
//                       right: 16,
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 44,
//                           width: 44,
//                           decoration: const BoxDecoration(
//                             color: Color(0xFF98A8B8),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Text(
//                           category,
//                           style: const TextStyle(
//                             fontSize: 14,
//                             color: Color(0xFF32343E),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Hot Dog',
      'Burger',
      'Pizza',
      'Drinks',
    ];

    return Column(
      children: [
        const _CategoryHeader(),
        const SizedBox(height: 20),
        _CategoryList(categories: categories),
      ],
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'All Categories',
            style: TextStyle(fontSize: 20, color: Color(0xFF32343E)),
          ),
          Row(
            children: const [
              Text(
                'See All',
                style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFA0A5BA),
                size: 16,
                weight: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  final List<String> categories;

  const _CategoryList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 24, right: 10),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          return _CategoryItem(
            label: category,
            onTap: () => log('Category selected: $category'),
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _CategoryItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.white,
      borderRadius: BorderRadius.circular(39),
      clipBehavior: Clip.none,
      child: InkWell(
        borderRadius: BorderRadius.circular(39),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 16),
          child: Row(
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: const BoxDecoration(
                  color: Color(0xFF98A8B8),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF32343E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}