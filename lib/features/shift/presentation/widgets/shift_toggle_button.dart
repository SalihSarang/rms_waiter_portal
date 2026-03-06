import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_event.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_event.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_state.dart';

class ShiftToggleButton extends StatelessWidget {
  const ShiftToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! Authenticated) return const SizedBox.shrink();

        final id = authState.staff.id;

        return BlocConsumer<ShiftBloc, ShiftState>(
          listener: (context, state) {
            if (state is ShiftError) {
              RmsSnackbar.show(
                context,
                message: state.message,
                type: RmsSnackbarType.error,
              );
            }
          },
          builder: (context, state) {
            final isActive = state is ShiftActive;
            final isLoading = state is ShiftLoading;

            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: NeutralColors.surface,
                      foregroundColor: NeutralColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: NeutralColors.border),
                      ),
                    ),
                    onPressed: isLoading
                        ? null
                        : () {
                            if (isActive) {
                              context.read<ShiftBloc>().add(EndShiftEvent(id));
                            } else {
                              context.read<ShiftBloc>().add(
                                StartShiftEvent(id),
                              );
                            }
                          },
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                NeutralColors.white,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isActive
                                    ? Icons.logout_rounded
                                    : Icons.login_rounded,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                isActive ? 'End Shift' : 'Start Shift',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StatusColors.cancelled,
                      foregroundColor: NeutralColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (isActive) {
                        context.read<ShiftBloc>().add(EndShiftEvent(id));
                      }
                      context.read<AuthBloc>().add(SignOutEvent());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout_rounded, size: 20),
                        const SizedBox(width: 12),
                        Text(
                          'End Shift & Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
