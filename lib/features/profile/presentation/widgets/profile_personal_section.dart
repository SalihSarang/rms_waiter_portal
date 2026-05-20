import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'profile_menu_item.dart';

/// The "PERSONAL" section with user details and menu items.
class ProfilePersonalSection extends StatelessWidget {
  const ProfilePersonalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! Authenticated) return const SizedBox.shrink();
        final staff = state.staff;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PERSONAL DETAILS',
              style: TextStyle(
                color: NeutralColors.icon,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            _DetailTile(
              icon: Icons.email_outlined,
              label: 'Email Address',
              value: staff.email.isNotEmpty ? staff.email : 'Not provided',
            ),
            _DetailTile(
              icon: Icons.phone_outlined,
              label: 'Phone Number',
              value: staff.phoneNumber.isNotEmpty
                  ? staff.phoneNumber
                  : 'Not provided',
            ),
            _DetailTile(
              icon: Icons.badge_outlined,
              label: 'Designation',
              value: staff.role.name.toUpperCase(),
            ),
            const SizedBox(height: 16),
            const Text(
              'ACCOUNT',
              style: TextStyle(
                color: NeutralColors.icon,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            ProfileMenuItem(
              icon: Icons.person_outline,
              title: 'Edit Profile Information',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile editing coming soon!')),
                );
              },
            ),
            ProfileMenuItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Support section coming soon!')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: NeutralColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: PrimaryColors.defaultColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: NeutralColors.icon,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: TextColors.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
