import 'package:flutter/material.dart';
import 'package:flutter_animated_theme/animated_theme_app.dart';
import 'package:flutter_animated_theme/animation_type.dart';
import 'package:flutter_change_theme/components/custom_drawer.dart';
import 'package:flutter_change_theme/components/custom_navbar.dart';
import 'package:flutter_change_theme/components/switch_change_theme.dart';
import 'package:flutter_change_theme/providers/navigation_provider.dart';
import 'package:flutter_change_theme/providers/theme_controller.dart';
import 'package:flutter_change_theme/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: Consumer<ThemeController>(
        builder: (context, themeProvider, child) {
          return AnimatedThemeApp(
            animationType: AnimationType.CIRCULAR_ANIMATED_THEME,
            animationDuration: const Duration(milliseconds: 200),
            title: 'Flutter Theme Demo',
            theme: AppTheme.lightTheme,
            locale: const Locale('pt', 'BR'),
            supportedLocales: const [
              Locale('pt', 'BR'),
            ],
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: const HomePage(title: 'Flutter change theme'),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CustomNavbar(title: widget.title),
      drawer: const CustomDrawer(),
      body: const Align(alignment: Alignment.center,child: SwitchChangeTheme(),),
    );
  }
}
