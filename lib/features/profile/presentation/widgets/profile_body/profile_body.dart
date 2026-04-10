import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../auth/presentation/bloc/auth_state.dart';
import 'components/profile_loading_view.dart';
import 'components/profile_details_view.dart';

/// A widget that manages the high-level authentication state for the profile.
/// It delegates the complex shift and order data logic to internal components.
class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        // Fallback for cases where staff data isn't yet available.
        if (authState is! Authenticated) {
          return const ProfileLoadingView();
        }

        return ProfileDetailsView(staff: authState.staff);
      },
    );
  }
}
