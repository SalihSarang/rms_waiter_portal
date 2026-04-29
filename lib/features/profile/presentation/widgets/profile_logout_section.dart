import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_state.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_event.dart';
import '../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../shift/presentation/bloc/shift_event.dart';
import '../../../shift/presentation/bloc/shift_state.dart';
import 'profile_action_button.dart';

class ProfileLogoutSection extends StatefulWidget {
  const ProfileLogoutSection({super.key});

  @override
  State<ProfileLogoutSection> createState() => _ProfileLogoutSectionState();
}

class _ProfileLogoutSectionState extends State<ProfileLogoutSection> {
  bool _isLoggingOut = false;

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    if (authState is! Authenticated) return const SizedBox.shrink();

    final staffId = authState.staff.id;
    final shiftState = context.watch<ShiftBloc>().state;
    final shiftData = shiftState.data;

    return BlocListener<ShiftBloc, ShiftState>(
      listener: (context, state) {
        if (_isLoggingOut) {
          if (state is ShiftReady && state.currentSession == null) {
            setState(() {
              _isLoggingOut = false;
            });
            context.read<AuthBloc>().add(SignOutEvent());
          } else if (state is ShiftError) {
            setState(() {
              _isLoggingOut = false;
            });
            context.read<AuthBloc>().add(SignOutEvent());
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ACCOUNT ACTIONS',
            style: TextStyle(
              color: NeutralColors.icon,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          ProfileActionButton(
            icon: Icons.logout_rounded,
            label: _isLoggingOut ? 'Logging out...' : 'Logout',
            backgroundColor: NeutralColors.surface,
            onTap: _isLoggingOut
                ? () {}
                : () {
                    RmsAlertDialog.show(
                      context,
                      title: 'Logout',
                      message: 'Are you sure you want to log out?',
                      type: RmsAlertDialogType.confirm,
                      onConfirm: () {
                        if (shiftData?.canEnd ?? false) {
                          setState(() {
                            _isLoggingOut = true;
                          });
                          context.read<ShiftBloc>().add(EndShiftEvent(staffId));
                        } else {
                          context.read<AuthBloc>().add(SignOutEvent());
                        }
                      },
                    );
                  },
          ),
        ],
      ),
    );
  }
}
