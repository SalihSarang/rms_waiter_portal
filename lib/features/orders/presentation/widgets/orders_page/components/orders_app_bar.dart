import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:waiter_portal/features/bottom_nav/presentation/bloc/main_screen/main_screen_cubit.dart';
import 'package:waiter_portal/features/profile/presentation/widgets/profile_header/components/profile_avatar.dart';

class OrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final staff = authState is Authenticated ? authState.staff : null;

    return AppBar(
      backgroundColor: NeutralColors.background,
      elevation: 0,
      centerTitle: true,
      title: const RmsAppBarTitle('My Orders'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {
              try {
                context.read<MainScreenCubit>().setIndex(2);
              } catch (_) {
                // Safely ignore if MainScreenCubit is not available in isolated widget testing
              }
            },
            child: Center(
              child: ProfileAvatar(
                imageUrl: (staff?.avatar != null && staff!.avatar.isNotEmpty)
                    ? staff.avatar
                    : null,
                name: staff?.name,
                isActive: staff?.isActive ?? true,
                radius: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
