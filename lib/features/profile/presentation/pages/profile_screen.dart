import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_state.dart';
import '../widgets/profile_authenticated_view.dart';
import '../widgets/profile_loading_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuth = context.select((AuthBloc b) => b.state is Authenticated);

    if (!isAuth) return const ProfileLoadingView();

    return const ProfileAuthenticatedView();
  }
}
