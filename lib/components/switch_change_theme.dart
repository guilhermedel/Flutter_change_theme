import 'package:flutter/material.dart';
import 'package:flutter_change_theme/providers/theme_controller.dart';
import 'package:provider/provider.dart';

class SwitchChangeTheme extends StatelessWidget {
  const SwitchChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(      
      value: context.watch<ThemeController>().themeMode == ThemeMode.dark,
      onChanged: (value) {
        context.read<ThemeController>().toggleTheme(value);
      },
    );
  }
}
