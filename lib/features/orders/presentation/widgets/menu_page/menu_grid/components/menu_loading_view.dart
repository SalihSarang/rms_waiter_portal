import 'package:flutter/material.dart';
import 'menu_skeleton.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';

/// [MenuLoadingView] displays a responsive grid of pulsing skeleton placeholders.
///
/// It's used to provide an immediate visual structure while the real menu data
/// is being fetched from the server.
class MenuLoadingView extends StatelessWidget {
  const MenuLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 180),
        physics:
            NeverScrollableScrollPhysics(), // Disable scroll during loading
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Matches the actual MenuItemCard grid
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: 6, // Show 6 placeholders to fill the viewport
        itemBuilder: (context, index) => MenuSkeleton(),
      ),
    );
  }
}
