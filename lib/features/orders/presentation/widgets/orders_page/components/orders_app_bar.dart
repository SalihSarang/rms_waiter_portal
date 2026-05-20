import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.background,
      elevation: 0,
      centerTitle: true,
      title: const RmsAppBarTitle('My Orders'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                radius: 18,
<<<<<<< HEAD
                backgroundColor: NeutralColors.appBarBackground,
=======
                backgroundColor: Color(0xFF2C3140),
>>>>>>> origin/main
                child: Icon(
                  Icons.person_outline,
                  color: TextColors.primary,
                  size: 20,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: SemanticColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: NeutralColors.background,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
