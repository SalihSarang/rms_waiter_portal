import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'hall_selector_grid_item.dart';

class HallSelectorGridView extends StatelessWidget {
  final List<HallModel> halls;

  const HallSelectorGridView({super.key, required this.halls});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(24),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: halls.length,
      itemBuilder: (context, index) {
        return HallSelectorGridItem(hall: halls[index]);
      },
    );
  }
}
