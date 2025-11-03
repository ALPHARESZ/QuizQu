import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/input_username_screen.dart';
import '../screens/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'input_username',
      builder: (context, state) => const InputUsernameScreen(),
    ),
    GoRoute(
    path: '/home',
    name: 'home',
    builder: (context, state) {
      final username = state.extra as String? ?? 'Guest';
      return HomeScreen(username: username);
    },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Halaman tidak ditemukan: ${state.error}'),
    ),
  ),
);
