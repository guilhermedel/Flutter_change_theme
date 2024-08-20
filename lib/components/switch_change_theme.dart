import 'package:flutter/material.dart';
import 'package:flutter_change_theme/providers/theme_controller.dart';
import 'package:provider/provider.dart';

class SwitchChangeTheme extends StatefulWidget {
  const SwitchChangeTheme({super.key});

  @override
  _SwitchChangeThemeState createState() => _SwitchChangeThemeState();
}

class _SwitchChangeThemeState extends State<SwitchChangeTheme>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    bool isDarkMode =
        context.read<ThemeController>().themeMode == ThemeMode.dark;
    context.read<ThemeController>().toggleTheme(!isDarkMode);

    // Inicia a animação de rotação
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: IconButton(
            icon: Icon(
              context.watch<ThemeController>().themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            color: context.watch<ThemeController>().themeMode == ThemeMode.light
                ? Colors.amber[800]
                : Colors.white,
            onPressed: _toggleTheme,
          ),
        );
      },
    );
  }
}
