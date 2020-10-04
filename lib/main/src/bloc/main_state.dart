part of 'main_bloc.dart';

enum MainStatus { planning, listing, profil }

class MainState extends Equatable {
  const MainState._(
      {this.tab = MainStatus.planning,
      this.index = 0,
      this.title = 'Planning'});

  const MainState.planning() : this._();

  const MainState.listing()
      : this._(tab: MainStatus.listing, index: 1, title: 'Listing');

  const MainState.profil()
      : this._(tab: MainStatus.profil, index: 2, title: 'Profil');

  final MainStatus tab;
  final int index;
  final String title;

  @override
  List<Object> get props => [tab];
}
