import 'package:bootcampo_extrados_class/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Rick and Morty',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: false,
      backgroundColor: const Color.fromARGB(255, 100, 31, 221),
      elevation: 10.0,
      actions: [
        IconButton(
            onPressed: () {
              appRoutes.go('/login');
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {
              appRoutes.go('/home');
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            )),
        IconButton(
          onPressed: () {
            //Salir de la aplicación
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
