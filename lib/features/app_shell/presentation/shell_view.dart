import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/core/router/route_names.dart';
import 'package:login_screen/core/widgets/app_bottom_nav_bar.dart';

class ShellView extends StatelessWidget {
  final Widget child;

  const ShellView({super.key, required this.child});

  static const List<String> _routes = [
    RouteNames.home,
    RouteNames.specialties,
    RouteNames.orders,
    RouteNames.favorites,
    RouteNames.profile,
  ];

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _routes.indexWhere((r) => location.startsWith(r));
    return index == -1 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex(context),
        onTap: (index) => context.go(_routes[index]),
      ),
    );
  }
}