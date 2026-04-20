import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_state.dart';
import '../../utils/profile_utils.dart';
import 'components/profile_avatar.dart';
import 'components/profile_info_column.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    if (authState is! Authenticated) return const SizedBox.shrink();

    final staff = authState.staff;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileAvatar(
          imageUrl: staff.avatar.isNotEmpty ? staff.avatar : null,
          isActive: staff.isActive,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ProfileInfoColumn(
            name: staff.name,
            role: ProfileUtils.formatRole(staff.role.name),
            isActive: staff.isActive,
          ),
        ),
      ],
    );
  }
}
