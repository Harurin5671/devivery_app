import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController = PageController();

  OnboardingBloc({required int totalSlides})
    : super(OnboardingState(totalSlides: totalSlides)) {
    on<SlideChangedEvent>(_onSlideChanged);
    on<NextSlideEvent>(_onNextSlide);
    on<SkipToLastSlideEvent>(_onSkipToLastSlide);
  }
  _onSlideChanged(SlideChangedEvent event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }

  _onNextSlide(NextSlideEvent event, Emitter<OnboardingState> emit) {
    final currentIndex = state.currentIndex;
    if (currentIndex < state.totalSlides - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentIndex: currentIndex + 1));
    }
  }

  _onSkipToLastSlide(
    SkipToLastSlideEvent event,
    Emitter<OnboardingState> emit,
  ) {
    final last = state.totalSlides - 1;
    pageController.animateToPage(
      last,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
