part of 'dashboard_tab_bloc.dart';

class DashboardTabState extends Equatable {
  const DashboardTabState({this.index = 0});

  final int index;

  DashboardTabState copyWith({int? index}) {
    return DashboardTabState(
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [index];
}
