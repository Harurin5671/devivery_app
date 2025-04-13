part of 'dashboard_tab_bloc.dart';

sealed class DashboardTabEvent extends Equatable {
  const DashboardTabEvent();

  @override
  List<Object?> get props => [];
}

final class DashboardTabChangedEvent extends DashboardTabEvent {
  const DashboardTabChangedEvent(this.newIndex);
  final int newIndex;

  @override
  List<Object?> get props => [newIndex];
}
