import 'package:flutter/material.dart';
import 'package:shopy/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(context.bloc<AuthenticationBloc>().state.user.name),
        RaisedButton(
          key: const Key('profil_logout_flatButton'),
          child: Text(
            'Logout',
            style: TextStyle(color: theme.primaryColor),
          ),
          onPressed: () => context
              .bloc<AuthenticationBloc>()
              .add(AuthenticationLogoutRequested()),
        )
      ],
    ));
  }
}
