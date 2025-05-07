import 'package:bootcampo_extrados_class/features/user_dio/domain/use_cases/get_user_id_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Text('Iniciar sesión'),
        ],
      )),
    );
  }
}

class FormSignIn extends StatefulWidget {
  const FormSignIn({super.key});

  @override
  State<FormSignIn> createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  late GetUserIdUseCase getUserIdUseCase;

  @override
  void initState() {
    getUserIdUseCase = GetUserIdUseCase(userRepository: GetIt.instance.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Ingrese su email',
            ),
            onChanged: (value) => email = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              hintText: 'Ingrese su contraseña',
            ),
            onChanged: (value) => password = value,
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                if (email.isNotEmpty || password.isNotEmpty) {
                  final response = await getUserIdUseCase.call(
                      email: email, password: password);
                  response.fold(
                    (l) {
                      debugPrint('Error: ${l.message}');
                      return l;
                    },
                    (r) {
                      debugPrint('User: ${r.toString()}');
                      return r;
                    },
                  );
                }
              } catch (e) {
                debugPrint('Error: $e');
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('termino la peticion'),
                  duration: const Duration(seconds: 10),
                ),
              );
            },
            child: const Text('Iniciar sesión'),
          ),
        ],
      ),
    );
  }
}
