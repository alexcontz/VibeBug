import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Prorotyp3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Accounting Made Simple',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            selected: true,
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Chart of Accounts'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/accounts');
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Journal Entries'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/journal');
            },
          ),
          ListTile(
            leading: const Icon(Icons.summarize),
            title: const Text('Reports'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/reports');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
