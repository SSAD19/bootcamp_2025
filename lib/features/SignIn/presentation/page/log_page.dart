import 'package:bootcampo_extrados_class/commons/widget/scaffold_custom.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/entity/user_entity.dart';
import 'package:bootcampo_extrados_class/features/SignIn/presentation/BLoc/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  late final SignInBloc _signInBloc;
  bool session = false;

  @override
  void initState() {
    super.initState();
    _signInBloc = context.read<SignInBloc>()..add(SignInEventLogIn());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      body: Column(children: [
        BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
          session = _signInBloc.sesionInit;
          if (state is SignInInitial) {
            return SignInCard();
          }

          if (state is SignInLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SignInError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is SignInLoaded) {
            return SignInCard(user: state.user);
          }

          return Text('Error inesperado');
        }),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed:
                  session ? () => _signInBloc.add(SignInEventLogOut()) : null,
              icon: Icon(
                Icons.person_off,
                color: session ? Colors.blueGrey : Colors.indigo,
              ),
            ),
            IconButton(
              onPressed:
                  !session ? () => _signInBloc.add(SignInEventLogOut()) : null,
              icon: Icon(
                Icons.person,
                color: !session ? Colors.blueGrey : Colors.indigo,
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class SignInCard extends StatelessWidget {
  final UserEntity? user;
  const SignInCard({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 12,
        margin: EdgeInsets.all(8.0),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(user != null
              ? ' Usuario: ${user!.userName}'
              : 'Registrese, por favor'),
        )));
  }
}
