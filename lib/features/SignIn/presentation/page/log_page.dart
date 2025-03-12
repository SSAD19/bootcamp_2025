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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      body: BlocBuilder<SignInBloc, SignInState>(
          bloc: context.watch<SignInBloc>(),
          builder: (context, state) {
            if (state is SignInInitial) {
              return Column(
                children: [
                  SignInCard(),
                ],
              );
            }

            if (state is SignInLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SignInError) {
              return Center(
                  child: SignInCard(
                text: state.message,
              ));
            }

            if (state is SignInLoaded) {
              return Column(
                children: [
                  SignInCard(user: state.user),
                ],
              );
            }

            return SignInCard(text: 'Error inesperado');
          }),
    );
  }
}

class SignInCard extends StatelessWidget {
  final UserEntity? user;
  final String? text;
  const SignInCard({super.key, this.user, this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 12,
        margin: EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user != null
                    ? ' Usuario: ${user!.userName}'
                    : text ?? 'Registrarse')),
            IconSession(
                icon: user != null
                    ? Icon(Icons.person_off_outlined)
                    : Icon(Icons.person),
                functionBloc:
                    user != null ? SignInEventLogOut() : SignInEventLogIn())
          ],
        )));
  }
}

class IconSession extends StatelessWidget {
  final SignInEvent functionBloc;
  final Icon icon;

  const IconSession(
      {super.key, required this.icon, required this.functionBloc});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => context.read<SignInBloc>()..add(functionBloc),
        icon: icon);
  }
}
