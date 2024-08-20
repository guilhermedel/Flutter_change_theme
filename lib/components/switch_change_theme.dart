import 'package:flutter/material.dart';
import 'package:flutter_change_theme/providers/theme_controller.dart';
import 'package:provider/provider.dart';

class SwitchChangeTheme extends StatelessWidget {
  const SwitchChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        context.watch<ThemeController>().themeMode == ThemeMode.dark
            ? Icons.dark_mode
            : Icons.light_mode,
      ),
      onPressed: () {
        bool isDarkMode =
            context.read<ThemeController>().themeMode == ThemeMode.dark;
        context.read<ThemeController>().toggleTheme(!isDarkMode);
      },
    );
  }
}
