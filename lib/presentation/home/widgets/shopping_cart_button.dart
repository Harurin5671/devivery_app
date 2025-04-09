import 'package:flutter/material.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 49,
          width: 45,
          decoration: BoxDecoration(
            color: Color(0xFF181C2E),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Color(0xFFFF7622),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '1',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


