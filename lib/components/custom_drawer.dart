import 'package:flutter/material.dart';
import 'package:flutter_change_theme/providers/navigation_provider.dart';
import 'package:flutter_change_theme/providers/theme_controller.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final themeProvider = Provider.of<ThemeController>(context);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Guilherme de Lamare Abreu',
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: const Text('glhrmdelamare@gmail.com',
                style: TextStyle(color: Colors.white)),
            currentAccountPicture: const Icon(
              Icons.account_circle,
              size: 40,
            ),
            decoration: BoxDecoration(color: themeProvider.themeMode==ThemeMode.light ? Colors.blue : Colors.grey[800]),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Home'),
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
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About'),
                  selected: navigationProvider.selectedIndex == 2,
                  onTap: () {
                    if (navigationProvider.selectedIndex != 2) {
                      navigationProvider.setSelectedIndex(2);
                    }
                  },
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
    );
  }
}
