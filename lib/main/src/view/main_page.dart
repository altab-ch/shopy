import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy/main/main.dart';
import 'package:shopy/profil/view/profil_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          context.bloc<MainBloc>().tabChanged(MainState.planning());
          break;
        case 1:
          context.bloc<MainBloc>().tabChanged(MainState.listing());
          break;
        case 2:
          context.bloc<MainBloc>().tabChanged(MainState.profil());
          break;
        default:
          context.bloc<MainBloc>().tabChanged(MainState.planning());
          break;
      }
    }

    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(context.bloc<MainBloc>().state.title)),
          body: Center(
            child: ProfilPage(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                label: 'Planning',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Listing',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
            currentIndex: context.bloc<MainBloc>().state.index,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}
