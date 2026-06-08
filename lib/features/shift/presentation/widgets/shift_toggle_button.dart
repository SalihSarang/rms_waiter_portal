import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_state.dart';
import 'package:waiter_portal/core/utils/ui_utils.dart';
import 'components/shift_toggle_content.dart';

class ShiftToggleButton extends StatelessWidget {
  const ShiftToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! Authenticated) return const SizedBox.shrink();

        return BlocConsumer<ShiftBloc, ShiftState>(
          listener: (context, state) {
            if (state is ShiftError) {
              UiUtils.showErrorSnackbar(context, state.message);
            }
          },
          builder: (context, state) {
            return ShiftToggleContent(state: state, authState: authState);
          },
        );
      },
    );
  }
}
