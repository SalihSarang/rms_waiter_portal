import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class FoodImageHeader extends StatelessWidget {
  final String imageUrl;

  const FoodImageHeader({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    NeutralColors.shadow.withValues(alpha: 0.6),
                    NeutralColors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
