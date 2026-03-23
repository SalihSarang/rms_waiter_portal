import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class BlockedScreen extends StatelessWidget {
  const BlockedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.block_flipped,
                size: 80,
                color: SemanticColors.error,
              ),
              const SizedBox(height: 32),
              const Text(
                'Account Blocked',
                style: TextStyle(
                  color: TextColors.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Your account has been deactivated by the manager. You no longer have access to the Waiter Portal.',
                style: TextStyle(
                  color: TextColors.secondary,
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: NeutralColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: NeutralColors.border.withValues(alpha: 0.1),
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Need help?',
                      style: TextStyle(
                        color: TextColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Please contact your restaurant manager to re-activate your account.',
                      style: TextStyle(
                        color: TextColors.secondary,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              RmsButton(
                text: 'Sign Out',
                onPressed: () {
                  context.read<AuthBloc>().add(SignOutEvent());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
