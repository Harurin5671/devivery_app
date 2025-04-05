part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class NextSlideEvent extends OnboardingEvent {}

class SkipToLastSlideEvent extends OnboardingEvent {}

class SlideChangedEvent extends OnboardingEvent {
  const SlideChangedEvent({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}
