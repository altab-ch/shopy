import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/main_page.dart';
import 'bloc/main_bloc.dart';

class Main extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => Main());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(),
      child: MainPage(),
    );
  }
}
