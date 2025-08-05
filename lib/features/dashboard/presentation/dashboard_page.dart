import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../bloc/dashboard_bloc.dart';
import '../../auth/bloc/auth_bloc.dart';
import 'widgets/app_drawer.dart';
import 'widgets/dashboard_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardBloc>()..add(const DashboardEvent.loadDashboard()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Prorotyp3 Dashboard'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text('Error: $message')),
                  loaded: (metrics, recentTransactions) => GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  DashboardCard(
                    title: 'Cash Balance',
                    value: '\$${metrics['cashBalance'] ?? '0'}',
                    icon: Icons.account_balance,
                    color: Colors.blue,
                  ),
                  DashboardCard(
                    title: 'Total Revenue',
                    value: '\$${metrics['totalRevenue'] ?? '0'}',
                    icon: Icons.trending_up,
                    color: Colors.green,
                  ),
                  DashboardCard(
                    title: 'Total Expenses',
                    value: '\$${metrics['totalExpenses'] ?? '0'}',
                    icon: Icons.trending_down,
                    color: Colors.red,
                  ),
                  DashboardCard(
                    title: 'Profit',
                    value: '\$${metrics['profit'] ?? '0'}',
                    icon: Icons.attach_money,
                    color: Colors.purple,
                  ),
                ],
              ),
    );
  }
}


