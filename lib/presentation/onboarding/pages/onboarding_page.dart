import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery/presentation/presentation.dart';

class OnboardingPage extends StatelessWidget {
  static const String routePath = '/onboarding';
  static const String routeName = 'onboarding_page';

  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(totalSlides: slides.length),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 40,
            left: 24,
            right: 24,
          ),
          child: Column(
            children: [
              OnboardingSlides(slides: slides),
              const SizedBox(height: 32),
              OnboardingProgressDots(),
              const SizedBox(height: 69),
              OnboardingNextButton(),
              const SizedBox(height: 16),
              OnboardingSkipButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final isLastSlide = state.currentIndex == slides.length - 1;

        return GestureDetector(
          onTap:
              () => context.read<OnboardingBloc>().add(SkipToLastSlideEvent()),
          child: Text(
            'Skip',
            style: TextStyle(
              color: isLastSlide ? Colors.transparent : Color(0xFF646982),
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context.read<OnboardingBloc>().add(NextSlideEvent()),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFFF7622)),
            minimumSize: WidgetStatePropertyAll<Size>(
              const Size(double.infinity, 62),
            ),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          child: Text(
            state.currentIndex == slides.length - 1 ? 'Get Started' : 'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}

class OnboardingProgressDots extends StatelessWidget {
  const OnboardingProgressDots({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(slides.length, (index) {
            final currentIndex =
                context.read<OnboardingBloc>().state.currentIndex;
            final isActive = index == currentIndex;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              width: isActive ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color:
                    isActive
                        ? Colors.orange
                        : Colors.orange.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        );
      },
    );
  }
}

List<SlideData> slides = [
  SlideData(
    title: 'All your Favorites',
    description:
        'Get all your loved foods in one once place,\nyou just place the order we do the rest',
  ),
  SlideData(
    title: 'All your Favorites',
    description:
        'Get all your loved foods in one once place,\nyou just place the order we do the rest',
  ),
  SlideData(
    title: 'Order from choosen chef',
    description:
        'Get all your loved foods in one once place,\nyou just place the order we do the rest',
  ),
  SlideData(
    title: 'Free delivery offers',
    description:
        'Get all your loved foods in one once place,\nyou just place the order we do the rest',
  ),
];

class SlideData {
  final String title;
  final String description;
  SlideData({required this.title, required this.description});
}
