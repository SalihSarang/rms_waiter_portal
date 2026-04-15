import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';

class BlockedSignOutButton extends StatelessWidget {
  const BlockedSignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RmsButton(
      text: 'Sign Out',
      onPressed: () {
        context.read<AuthBloc>().add(SignOutEvent());
      },
    );
  }
}
