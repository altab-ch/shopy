import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState.planning());

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is TabChanged) {
      yield _mapTabChangedToState(event);
    } else {
      print("unknown event");
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

  void tabChanged(MainState newTab) {
    add(TabChanged(newTab));
  }

  MainState _mapTabChangedToState(
    TabChanged event,
  ) {
    switch (event.status.tab) {
      case MainStatus.planning:
        return MainState.planning();
        break;
      case MainStatus.listing:
        return MainState.listing();
        break;
      case MainStatus.profil:
        return MainState.profil();
        break;
    }
    return MainState.planning();
  }
}
