import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/input_username_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'start',
      builder: (context, state) => const InputUsernameScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Halaman tidak ditemukan: ${state.error}'),
    ),
  ),
);
