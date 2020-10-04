part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class TabChanged extends MainEvent {
  const TabChanged(this.status);

  final MainState status;

  @override
  List<Object> get props => [status];
}
