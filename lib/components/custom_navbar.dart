import 'package:flutter/material.dart';
import 'package:flutter_change_theme/components/switch_change_theme.dart';

class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomNavbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Abrir Menu', // Altere o tooltip aqui
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
