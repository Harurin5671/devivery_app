import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_tab_event.dart';
part 'dashboard_tab_state.dart';

class DashboardTabBloc extends Bloc<DashboardTabEvent, DashboardTabState> {
  DashboardTabBloc() : super(DashboardTabState()) {
    on<DashboardTabChangedEvent>(_onDashboardTabChanged);
  }
  void _onDashboardTabChanged(DashboardTabChangedEvent event, emit) {
    emit(state.copyWith(index: event.newIndex));
  }
}
