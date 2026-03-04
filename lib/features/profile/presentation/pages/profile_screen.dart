import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_event.dart';
import 'package:waiter_portal/features/auth/presentation/pages/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: TextColors.inverse),
        ),
        backgroundColor: NeutralColors.surface,
        iconTheme: const IconThemeData(color: TextColors.inverse),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(SignOutEvent());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(
            color: TextColors.inverse,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
