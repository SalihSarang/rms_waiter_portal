import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_event.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_state.dart';

/// A banner that warns the waiter if their shift is inactive and allows them to start it.
class ShiftWarningBanner extends StatelessWidget {
  const ShiftWarningBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! Authenticated) return const SizedBox.shrink();

        final staff = authState.staff;

        return BlocBuilder<ShiftBloc, ShiftState>(
          builder: (context, shiftState) {
            final shiftData = shiftState.data;
            if (shiftData?.canEnd ?? false) return const SizedBox.shrink();

            const title = 'Shift Inactive';
            const subtitle = 'Please start your shift to manage orders.';

            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: SemanticColors.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: SemanticColors.error.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: SemanticColors.error.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.warning_amber_rounded,
                      color: SemanticColors.error,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          title,
                          style: TextStyle(
                            color: TextColors.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          subtitle,
                          style: TextStyle(
                            color: NeutralColors.icon,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (shiftData?.canStart ?? true) {
                        context.read<ShiftBloc>().add(StartShiftEvent(staff));
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: SemanticColors.error,
                      foregroundColor: TextColors.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Start Shift',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
