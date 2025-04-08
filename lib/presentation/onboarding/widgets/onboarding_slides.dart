import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery/presentation/presentation.dart';

class OnboardingSlides extends StatelessWidget {
  const OnboardingSlides({super.key, required this.slides});

  final List<SlideData> slides;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: context.read<OnboardingBloc>().pageController,
        itemCount: slides.length,
        onPageChanged:
            (index) => context.read<OnboardingBloc>().add(
              SlideChangedEvent(index: index),
            ),
        itemBuilder: (context, index) {
          final slide = slides[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  color: const Color(0xFF98A8B8),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 43),
              Text(
                slide.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                slide.description,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
