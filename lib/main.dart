import 'package:flutter/material.dart';
import 'package:flutter_change_theme/components/custom_navbar.dart';
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
          return MaterialApp(
            title: 'Flutter Theme Demo',
            theme: AppTheme.lightTheme,
            locale: const Locale('pt', 'BR'),
            supportedLocales: const [
              Locale('pt', 'BR'),
            ],
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: HomePage(title: 'Flutter change theme'),
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
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      appBar: CustomNavbar(title: widget.title),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Guilherme de Lamare Abreu',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text('glhrmdelamare@gmail.com',
                  style: TextStyle(color: Colors.white)),
              currentAccountPicture: Icon(
                Icons.account_circle,
                size: 40,
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Agendamentos'),
                    selected: navigationProvider.selectedIndex == 0,
                    onTap: () {
                      if (navigationProvider.selectedIndex != 0) {
                        navigationProvider.setSelectedIndex(0);
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bar_chart_rounded),
                    title: const Text('Dashboards'),
                    selected: navigationProvider.selectedIndex == 1,
                    onTap: () {
                      if (navigationProvider.selectedIndex != 1) {
                        navigationProvider.setSelectedIndex(1);
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.work_rounded),
                    title: const Text('Funcionários'),
                    selected: navigationProvider.selectedIndex == 2,
                    onTap: () {
                      if (navigationProvider.selectedIndex != 2) {
                        navigationProvider.setSelectedIndex(2);
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.people),
                    title: const Text('Clientes'),
                    selected: navigationProvider.selectedIndex == 3,
                    onTap: () {
                      if (navigationProvider.selectedIndex != 3) {
                        navigationProvider.setSelectedIndex(3);
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.inventory),
                    title: const Text('Produtos'),
                    selected: navigationProvider.selectedIndex == 4,
                    onTap: () {
                      if (navigationProvider.selectedIndex != 4) {
                        navigationProvider.setSelectedIndex(4);
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.miscellaneous_services),
                    title: const Text('Serviços'),
                    selected: navigationProvider.selectedIndex == 5,
                    onTap: () {
                      if (navigationProvider.selectedIndex != 5) {
                        navigationProvider.setSelectedIndex(5);
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.monetization_on_outlined),
                    title: const Text('Vendas'),
                    selected: navigationProvider.selectedIndex == 6,
                    onTap: () {
                      if (navigationProvider.selectedIndex != 6) {
                        navigationProvider.setSelectedIndex(6);
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.engineering),
                    title: const Text('Funções'),
                    selected: navigationProvider.selectedIndex == 7,
                    onTap: () {
                      if (navigationProvider.selectedIndex != 7) {
                        navigationProvider.setSelectedIndex(7);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Configurações'),
                    selected: navigationProvider.selectedIndex == 8,
                    onTap: () {
                      if (navigationProvider.selectedIndex != 8) {
                        navigationProvider.setSelectedIndex(8);
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
