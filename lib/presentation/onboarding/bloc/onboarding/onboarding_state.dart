part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  const OnboardingState({this.currentIndex = 0, this.totalSlides = 0});

  final int currentIndex;
  final int totalSlides;

  OnboardingState copyWith({int? currentIndex, int? totalSlides}) {
    return OnboardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      totalSlides: totalSlides ?? this.totalSlides,
    );
  }

  @override
  List<Object> get props => [currentIndex, totalSlides];
}
